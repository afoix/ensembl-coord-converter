use strict;
use Bio::EnsEMBL::Registry;
use Bio::EnsEMBL::Slice;

if ($#ARGV + 1 != 3) {
    die "Usage: convert-h38-to-h37.pl <chromosome> <start> <end>\n";
}

my $registry = 'Bio::EnsEMBL::Registry';

$registry->load_registry_from_db(
	-host => 'ensembldb.ensembl.org',
	-user => 'anonymous'
);

my $slice_adaptor = $registry->get_adaptor( 'Human', 'Core', 'Slice' );

my ($chromosome, $start, $end) = @ARGV;

# Obtain a slice covering the requested region in the GRCh38 coordinate system
my $slice = $slice_adaptor->fetch_by_region( 'chromosome', $chromosome, $start, $end, '1', 'GRCh38' );

# Project this slice into the GRCh37 coordinate system
my $projection = $slice->project('chromosome', 'GRCh37');
my $projection_count = scalar @$projection;

print "The region $start-$end on chromosome $chromosome in GRCh38 corresponds to $projection_count regions in GRCh37:\n";

foreach my $segment (@$projection) {
    print (($start + $segment->from_start() - 1), '-', ($start + $segment->from_end() - 1), ' -> ');
    my $targetSlice = $segment->to_Slice();
    my $region_name = $targetSlice->seq_region_name();
    my $region_start   = $targetSlice->start();
    my $region_end     = $targetSlice->end();
    print "$region_name, $region_start-$region_end\n";
}
