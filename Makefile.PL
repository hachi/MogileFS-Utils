#!/usr/bin/perl

use ExtUtils::MakeMaker;

my $exe_files;

foreach("mogtool", "mogadm")
{
	push @$exe_files, $_ if -e;
}

warn "No \$exe_files!" unless defined($exe_files);

WriteMakefile(
    NAME			=> 'MogileFS-Utils',
    VERSION			=> '1.00',
    AUTHOR			=> 'Brad Whitaker <whitaker@danga.com>',
    ABSTRACT			=> 'MogileFS client library',
    EXE_FILES			=> $exe_files,
    PREREQ_PM			=> {
        'LWP::Simple' => 0,
	'Compress::Zlib' => 0,
    },
    dist                    => {
        CI                      => "cvs commit",
        RCS_LABEL               => 'cvs tag RELEASE_$(VERSION_SYM)',
        SUFFIX                  => ".gz",
        DIST_DEFAULT            => 'all tardist',
        COMPRESS                => "gzip",
    },

);

