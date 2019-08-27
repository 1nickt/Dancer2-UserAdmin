package Dancer2::Plugin::UserAdmin;

our $VERSION = '0.9903';

use Method::Signatures;
use Dancer2::Plugin;

sub BUILD {
    my $self = shift;
    my $app = $self->app;

#    $app->register_plugin(Dancer2::Plugin::Auth::Extensible->new(
#        app    => $app,
#        realms => [{ name => 'users', provider => 'DBIC', %{ $app->config->{UserAdmin}{auth} } }],
#    ));

    # user registration form
    $app->add_route(
        method => 'get',
        regexp => '/register',
        code   => sub { $_[0]->template('user_admin/register-form.tt') },
    );

    $app->add_route(
        method => 'post',
        regexp => '/register',
        code   => sub {
            my $app = shift;
            $app->template('user_admin/register-form.tt');
        },
    );


}

method _render_template ($view, $tokens={}) {
    my $template = path( dist_dir('Dancer2-Plugin-UserAdmin'), 'views', $view );
     $self->_tt->render( $template, $tokens );
}

1;
 
__END__