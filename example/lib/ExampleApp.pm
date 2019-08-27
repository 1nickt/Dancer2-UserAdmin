package ExampleApp;

BEGIN {
	use FindBin qw/ $RealBin /;
	use lib "$RealBin/lib";
}

use Dancer2;
use Dancer2::Plugin::Debugger;
use Dancer2::Plugin::UserAdmin;
use Dancer2::Plugin::Auth::Extensible;

get '/' => sub {
	use Data::Dumper;
	warn Dumper config->{plugins};

	template 'hello.tt' => { username => 'world' };  
};

get '/foo' => require_role registered_user => sub {
	template 'hello.tt' => { username => logged_in_user->username };
};

1;

__END__
