package ExampleApp {
	use Dancer2;
	use Dancer2::Plugin::UserAdmin;
	
	get '/' => sub {
		return 'Hello, world';  
	};
};

1;

__END__
