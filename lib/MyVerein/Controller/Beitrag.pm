package MyVerein::Controller::Beitrag;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

MyVerein::Controller::Beitrag - Catalyst Controller

=head1 DESCRIPTION

Deal with the membership fees

=head1 METHODS

=cut


=head2 index

Call default method -> list membership fees

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    $c->detach('list');
}

=head2 list

List all membership fees

=cut

sub list :Local :Args(0) {
    my ($self, $c) = @_;
    $c->stash(beitraege => [$c->model('MyVereinDB::Beitrag')->all]);
    $c->stash(template => 'beitrag/list.tt');
}

=head2 delete

Delete a membership fee

=cut

sub delete :Local :Args(1) {
    my ($self, $c, $id) = @_;
    if ($id) {
        my $beitrag = $c->model('MyVereinDB::beitrag')->find($id);
#        my $deleted = $beitrag->delete;
        $c->response->redirect($c->uri_for($self->action_for('list')));
    } else {
        $c->response->redirect($c->uri_for($self->action_for('list')));
    }
}


=encoding utf8

=head1 AUTHOR

,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
