package Dancer2::Plugin::UserAdmin;

our $VERSION = '0.9903';

use Method::Signatures;
use File::Share 'dist_dir';
use Dancer2::FileUtils 'path';
use Dancer2::Plugin;

has site_name => (
    is             => 'ro',
    from_config    => 1,
    default        => 'this site',
    plugin_keyword => 1,
);

after BUILD => sub {
    my $site_name = $_[0]->site_name;
    my $dsl = $_[0]->dsl;
    $_[0]->app->add_hook( Dancer2::Core::Hook->new(
        name => 'before',
        code => sub { $dsl->var(site_name => $site_name) },
    ));
};

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
        code   => sub { $self->_render_template('register.tt') },
    );

    $app->add_route(
        method => 'post',
        regexp => '/register',
        code   => sub {
            my $app = shift;
            $app->template('user_admin/register.tt');
        },
    );


}

method _render_template ($view, $tokens={}) {
    my $template = path( dist_dir('Dancer2-Plugin-UserAdmin'), 'views', $view );
    return $self->app->template( $template, $tokens );
}

1;
 
__END__