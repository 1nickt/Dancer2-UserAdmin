package Dancer2::Handler::UserAdmin;

our $VERSION = '0.9903';
use Moo;

use Dancer2::Core::Types;

warn "I am being loaded";

with qw/
    Dancer2::Core::Role::Handler
    Dancer2::Core::Role::StandardResponses
/;

sub regexp { '/user**?' }
 
sub methods { qw/ get post / }

sub register {
    my ( $self, $app ) = @_;
    warn "I AM BEING REGISTERED";
 
    return unless $app->config->{user_admin};
 
    $app->add_route(
        method => $_,
        regexp => $self->regexp,
        code   => $self->code,
    ) for $self->methods;
}
 
sub code {
    sub {
        my $app    = shift;
        my $prefix = shift;

        return "I was handled";
    };
}
  
1;
 
__END__