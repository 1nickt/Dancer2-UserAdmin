package Dancer2::UserAdmin::User;

use Moo::Role;

# create a user and render a response
sub register_as_user {
	my $self = shift;

	my $params = app->request->params || {};

	my $user = $self->create_user($params);

	return $self->_template('user_admin/register-success.tt', {
		user => %{ $user },
	});
}

# create a DB user record and return it
sub create_user {
	my ($self, $params) = @_;
	
	return schema->result_set('Users')->create({
		email      => $params->{email},
		username   => $params->{username},
		password   => $params->{password},
		first_name => $params->{first_name},
		last_name  => $params->{last_name},
		is_test    => 0,
	});
}

1;