#===============================================================================
#
#         FILE: %FFILE%
#
#  DESCRIPTION:
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: %USER%, %MAIL%
# ORGANIZATION:
#      VERSION: 0.1
#      CREATED: %FDATE%
#     REVISION: ---
#===============================================================================

package %HERE%%FILE%;

use strict;
use warnings;

sub new {
    my $class = shift;
    my $self = {};
    bless ($self, $class);
    return $self;
}

1;
