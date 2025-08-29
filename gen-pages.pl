#!/usr/bin/env perl

use v5.14;

use strict;
use warnings;

use lib('../..');
use GENFUNCS;

# site title
my $title = 'P &amp; S Railroad';

# site header lines
my @header_lines
  = (
     "    <h1>Pennsylvania &amp; Southern Railroad</h1>"
    );

# page resource lines
my @resource_lines
  = (
     "<link rel='stylesheet' href='./Resources/css/psrr.css' />",
     "<link rel='stylesheet' href='./Resources/css/tables.css' />",
     "<link rel='icon' type='image/png'  href='https://psrr.info/psrr-icon.png' />",
    );

# lines for body background style
my @background_lines
  = (
     #"<style>",
     #"body {",
     #"    background: url(./resources2/pss-logo-mod-multiple-plain.svg);",
     #"    background-size: 50px 50px;",
     #"    background-color: #C0C0C0;",
     #"}",
     #"</style>",
    );

# files for pre-processing (*.source => *.content [by type])
my %preproc_fils
  = (
     'friends'             => 'member',
     'pauls-reports'       => 'report',
     'site-news'           => 'report',
     'individual-projects' => 'project',
     'p-and-s-rules'       => 'list',
    );

# main pages (or page insertion) with their own content
# (footer and credits are "standard")
my @pfils
  = (
     'index',
     'track-plan',
     'site-news',
     'friends',
     'gnomes',
     'pauls-reports',
     'group-projects',
     'individual-projects',
     'resources',
     'menu',
     'roster',
     'events',
     'rr-clubs',
     'p-and-s-rules',
     'engine',
     'suppliers',
     'history',
     'photography',
     );

foreach my $arg (@ARGV) {
  $GENFUNCS::debug = 1
    if $arg =~ m{\A -d}x;
}

my $pwd = `pwd`;
chomp $pwd;
say "DEBUG is on, pwd is '$pwd'"
  if (0 && $GENFUNCS::debug);

if ((keys %preproc_fils)) {
  GENFUNCS::preproc_pages({
			   dir         => $pwd,
			   fils_href   => \%preproc_fils,
			   roster_file => 'roster',
			  });
}

GENFUNCS::gen_pages({
		     dir             => $pwd,
		     page_aref       => \@pfils,
		     title           => $title,
		     header_aref     => \@header_lines,
		     resource_aref   => \@resource_lines,
		     background_aref => \@background_lines,
		    });

