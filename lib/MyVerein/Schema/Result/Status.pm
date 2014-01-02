use utf8;
package MyVerein::Schema::Result::Status;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyVerein::Schema::Result::Status

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<status>

=cut

__PACKAGE__->table("status");

=head1 ACCESSORS

=head2 id

  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 status

  data_type: 'varchar'
  is_nullable: 0
  size: 30

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "tinyint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "status",
  { data_type => "varchar", is_nullable => 0, size => 30 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07038 @ 2014-01-02 22:13:07
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:dh96uKQKwVfWldk6ZOrNTQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
