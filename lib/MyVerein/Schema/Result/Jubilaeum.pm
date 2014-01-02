use utf8;
package MyVerein::Schema::Result::Jubilaeum;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

MyVerein::Schema::Result::Jubilaeum

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

=head1 TABLE: C<jubilaeum>

=cut

__PACKAGE__->table("jubilaeum");

=head1 ACCESSORS

=head2 jalter

  data_type: 'smallint'
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "jalter",
  { data_type => "smallint", extra => { unsigned => 1 }, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</jalter>

=back

=cut

__PACKAGE__->set_primary_key("jalter");


# Created by DBIx::Class::Schema::Loader v0.07038 @ 2014-01-02 22:13:07
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:72jBF2VK1GcPiqJq2DZtkA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
