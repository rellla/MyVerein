package MyVerein::Controller::Mitglied;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

MyVerein::Controller::Mitglied - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    $c->detach('list');
}

=head2 list

Alle Mitglieder in einer Tabelle anzeigen. Sortierbar, filterbar, durchsuchbar.

=cut

sub list :Local {
    my ($self, $c) = @_;
    $c->stash(template => 'mitglied/list.tt');
}

=head2 show

Karteikarte eines Mitglieds anzeigen.

=cut

sub show :Local {
    my ($self, $c, $id) = @_;
    $c->stash(
        mitglieder => [$c->model('MyVereinDB::Mitglied')->search({mid => $id }),
        ]
    );
}

=head2 delete

Mitglied löschen.

=cut

sub delete :Local :Args(1) {
    my ($self, $c, $mid) = @_;
    if ($mid) {
        my $mitglied = $c->model('MyVereinDB::Mitglied')->find($mid);
#        my $deleted = $mitglied->delete;
        $c->response->redirect($c->uri_for($self->action_for('list'),
            {mid => $c->set_status_msg("Mitglied gelöscht.")}));
    } else {
        $c->response->redirect($c->uri_for($self->action_for('list'),
            {mid => $c->set_status_msg("Mitglied nicht gelöscht.")}));
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
