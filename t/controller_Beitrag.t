use strict;
use warnings;
use Test::More;


use Catalyst::Test 'MyVerein';
use MyVerein::Controller::Beitrag;

ok( request('/beitrag')->is_success, 'Request should succeed' );
done_testing();
