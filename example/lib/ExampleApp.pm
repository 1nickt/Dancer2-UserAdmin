package ExampleApp;

our $VERSION = '0.9903';

use Dancer2;
use Dancer2::UserAdmin;

get '/ping' => sub {
    return "Hello, world";  
};

1;

__END__
