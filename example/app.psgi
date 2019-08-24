use FindBin qw/ $RealBin /;
use lib "$RealBin/lib";
use lib "$RealBin/../lib";

use ExampleApp;

ExampleApp->to_app;
