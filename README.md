# GRCh38 to GRCh37 coordinate converter

This is a tool to convert coordinates on chromosomes in the GRCh38 assembly to their coordinates in the GRCh37 assembly.

The tool requires that the Ensembl 98 Perl modules are installed and in your PERL5LIB environment variable, [as described in the installation instructions.](http://www.ensembl.org/info/docs/api/api_installation.html) You can also run the tool inside the [Ensembl Virtual Machine](http://www.ensembl.org/info/data/virtual_machine.html)

Usage for the tool:

```
> perl convert-h38-to-h37.pl <chromosome> <start> <end>
```

Example:

```
> perl convert-h38-to-h37.pl 5 15000 25000

The region 15000-25000 on chromosome 5 in GRCh38 corresponds to 2 regions in GRCh37:
15000-24450 -> 5, 15000-24450
24452-25000 -> 5, 24451-24999
```

# Python approach

# Java approach
