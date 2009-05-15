use strict;
use warnings;
use ExtUtils::MakeMaker;

eval "use Test::Tester";

WriteMakefile(
	NAME          => 'Test::Output',
	AUTHOR        => 'brian d foy <bdfoy@cpan.org>',
	VERSION_FROM  => 'lib/Test/Output.pm',
	LICENSE       => 'perl',
	ABSTRACT_FROM => 'lib/Test/Output.pm',
	PL_FILES      => {},
	PREREQ_PM     => {
		'Test::Tester'  => '0.107',
		'Test::More'    => '0',
		'Sub::Exporter' => '0',
		'File::Temp'    => '0.17', # this is where :seekable first appears
		},

	dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
	clean => { FILES    => 'Test-Output-*' },
);
