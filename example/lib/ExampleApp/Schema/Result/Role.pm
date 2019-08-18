use utf8;
package ExampleApp::Schema::Result::Role;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

ExampleApp::Schema::Result::Role

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<role>

=cut

__PACKAGE__->table("role");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 type_id

  data_type: 'integer'
  default_value: null
  is_foreign_key: 1
  is_nullable: 0

=head2 user_id

  data_type: 'integer'
  default_value: null
  is_foreign_key: 1
  is_nullable: 0

=head2 created_at

  data_type: 'datetime'
  default_value: current_timestamp
  is_nullable: 0

=head2 modified_at

  data_type: 'datetime'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "type_id",
  {
    data_type      => "integer",
    default_value  => \"null",
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "user_id",
  {
    data_type      => "integer",
    default_value  => \"null",
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "created_at",
  {
    data_type     => "datetime",
    default_value => \"current_timestamp",
    is_nullable   => 0,
  },
  "modified_at",
  { data_type => "datetime", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<user_id_type_id_unique>

=over 4

=item * L</user_id>

=item * L</type_id>

=back

=cut

__PACKAGE__->add_unique_constraint("user_id_type_id_unique", ["user_id", "type_id"]);

=head1 RELATIONS

=head2 roles

Type: has_many

Related object: L<ExampleApp::Schema::Result::Role>

=cut

__PACKAGE__->has_many(
  "roles",
  "ExampleApp::Schema::Result::Role",
  { "foreign.user_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 type

Type: belongs_to

Related object: L<ExampleApp::Schema::Result::RoleType>

=cut

__PACKAGE__->belongs_to(
  "type",
  "ExampleApp::Schema::Result::RoleType",
  { id => "type_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 user

Type: belongs_to

Related object: L<ExampleApp::Schema::Result::Role>

=cut

__PACKAGE__->belongs_to(
  "user",
  "ExampleApp::Schema::Result::Role",
  { id => "user_id" },
  { is_deferrable => 0, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-17 21:21:04
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:qNhIjyRBXde6zvvOfuOTKg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
