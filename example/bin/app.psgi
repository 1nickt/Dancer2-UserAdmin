use strict;
use warnings;

BEGIN {
	use FindBin qw/ $RealBin /;
	use lib "$RealBin/../lib";
	use lib "$RealBin/../../lib";
}

use Plack::Builder;

use Dancer2::Debugger;
use Plack::Debugger::Panel::Dancer2::Logger;
my $debugger = Dancer2::Debugger->new;

use ExampleApp;

my $app = ExampleApp->to_app;

builder {
    $debugger->mount;
    mount '/' => builder {
        $debugger->enable;
        $app;
    }
};