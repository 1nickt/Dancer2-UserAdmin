package Dancer2::Plugin::UserAdmin;

our $VERSION = '0.9903';

use File::Share 'dist_dir';
use Method::Signatures;
use Dancer2::Plugin;
use Dancer2::Template::Tiny;
#use namespace::clean;

with 'Dancer2::UserAdmin';

has _tt => (
    is      => 'ro',
    default => sub { Dancer2::Template::Tiny->new },
);

method _template ($view, $vars=+{}) {
    my $template = path( dist_dir('Dancer2-Plugin-UserAdmin'), 'views', $view );
    $self->_tt->render( $template, $vars );
}

method BUILD (...) {
    my $app = $self->app;

    # New user registration
    $app->add_route(
        method => 'get',
        regexp => qr!^ /user/register $!x,
        code   => sub {
            my $app = shift;
            $self->_template('user_admin/register-form.tt');
        },
    );

    $app->add_route(
        method => 'post',
        regexp => qr!^ /user/register $!x,
        code   => sub {
            my $app = shift;
            $self->register_current_user;
        },
    );
}

1;
 
__END__