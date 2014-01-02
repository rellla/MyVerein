use strict;
use warnings;

use MyVerein;

my $app = MyVerein->apply_default_middlewares(MyVerein->psgi_app);
$app;

