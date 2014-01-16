#!/usr/bin/perl

use strict;
use warnings;

use MyVerein::Schema;

my $schema = MyVerein::Schema->connect('dbi:mysql:myverein', 'mvdbuser', 'mvdbpassword');

my @users = $schema->resultset('AuthUser')->all;

foreach my $user (@users) {
    $user->password('password');
    $user->update;
}