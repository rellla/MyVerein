use strict;
use warnings;
use Test::More;


use Catalyst::Test 'MyVerein';
use MyVerein::Controller::Mitglied;

ok( request('/mitglied')->is_success, 'Request should succeed' );
done_testing();
