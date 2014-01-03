use strict;
use warnings;
use Test::More;


use Catalyst::Test 'MyVerein';
use MyVerein::Controller::MitgliederRestAPI;

ok( request('/mitgliederrestapi')->is_success, 'Request should succeed' );
done_testing();
