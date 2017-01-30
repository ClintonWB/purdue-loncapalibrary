=head1 texsum

Format a sum of elements, dropping +-1 coefficients and 0 terms appropriately 

=head2 SYNOPSIS

    &texsum([1,2,0,4],['a','b','c']) # eq 'a+2b+4'

=head2 Description

Given a list of numerical coefficients,
and a list of string summands,
formats the string for display in a tex field.

=head2 USAGE

    &texsum(\@coeffs, \@basis)

=over 4

=item * \@coeffs

An array reference to a list of numerical coefficients.

Be careful that you use a refernce - perl interprets f((a,b),c) as f(a,b,c).
When inlining, use square brackets [a,b] to create a reference to an
anonymous list.

=item * \@basis

An array reference to a list of symbols.
If it is shorter than the list of coefficients, 
the remainder are assumed to be blank ''.

=back

=cut

sub texsum(\@\@) {
    my $coeffs = $_[0];
    my $basis = $_[1];
    
    my $sumstring = '';
    my $length = $#{$coeffs};

    my $leading = 1; #Set true until a nonzero coefficient is found 
    for (my $i = 0; $i <= $length; $i++){
        my $coeff = ${$coeffs}[$i];
        if ($coeff != 0) {
            if ($coeff > 0 && !$leading){
                $sumstring = $sumstring . "+";
            }
            $leading = 0;
            if (!defined ${$basis}[$i] || ${$basis}[i] eq ''){
                $sumstring = $sumstring . $coeff;
            }
            else {
                if ($coeff == -1) {
                    $sumstring = $sumstring . '-';
                }
                elsif ($coeff != 1) {
                    $sumstring = $sumstring . $coeff;
                }
                $sumstring = $sumstring . ${$basis}[$i];
            }
        }
    }
    #If there is no nonzero coefficient, there has been no leading coefficient;
    if ($leading) {
        $sumstring = '0';
    }
    return $sumstring;
}

=head1 texpoly

A polynomial formatter for LonCapa

=head2 SYNOPSIS
    
    &texpoly([1,0,@a,@b],'y')
    &texpoly([@a,-1,0,@b])

=head2 DESCRIPTION

Formats a list as coefficients of a single-variable polynomial,
with an optional second parameter to specify the variable.

=head2 USAGE

    &texpoly(\@coeffs, $base)

=over 4

=item * \@coeffs

An array reference to a list of numerical coefficients, in decreasing
order of degree.

Be careful that you use a refernce - perl interprets f((a,b),c) as f(a,b,c).
When inlining, use square brackets [a,b] to create a reference to an
anonymous list.

=item * $base

Default value 'x'

A string such as 'y' or 'z' to specify a different variable.

=back

=cut

sub texpoly(\@;$) {
    my $coeffs = $_[0];
    my $base = $_[1];
    my $basis;
    if (!defined $base) {
        $base = 'x';
    }
    if ($#{$coeffs} > 0){
        $basis = [map {"$base^{$_}"} reverse 2..$#{$coeffs}];
        push(@$basis,"$base");
    }
    return &texsum($coeffs,$basis);
}

=head1 commify

Official perldoc version for comma-formatting integers and decimal numbers.

=head2 SYNOPSIS

    &commify(1234.5678) # eq '1,234.5678' 

=head2 Description

 Adds commas between every third digit (counting from the ones place) to a integer, or to a decimal before the '.' 

=head2 USAGE

    &texsum($number)

=over 4

=item * number

    A decimal or integer number.

=back

=cut

sub commify {
    local $_  = shift;
    1 while s/^(-?\d+)(\d{3})/$1,$2/;
    return $_;
}

# Tests
print "texsum 1..8\n"; #1 to number of tests
print &texsum([1],['a']) eq 'a' ? "ok 1\n" : "not ok 1\n";
print &texsum([-1],['a']) eq '-a' ? "ok 2\n" : "not ok 2\n";
print &texsum([2],['a']) eq '2a' ? "ok 3\n" : "not ok 2\n";
print &texsum([2,1],['a']) eq '2a+1' ? "ok 4\n" : "not ok 4\n";
print &texsum([2,-1],['a']) eq '2a-1' ? "ok 5\n" : "not ok 5\n";
print &texsum([2,-4],['a']) eq '2a-4' ? "ok 6\n" : "not ok 6\n";
print &texsum([-5..5],['a','b','c','d']) eq '-5a-4b-3c-2d-1+1+2+3+4+5' ? "ok 7\n" : "not ok 7\n";
print &texsum([1,2],['a','b','c']) eq 'a+2b' ? "ok 8\n" : "not ok 8\n";

print "texpoly 1..8\n";
print &texpoly([1]) eq '1' ? "ok 1\n" : "not ok 1\n";
print &texpoly([1],'y') eq '1' ? "ok 2\n" : "not ok 2\n";
print &texpoly([1,-1]) eq 'x-1' ? "ok 3\n" : "not ok 3\n";
print &texpoly([1,-1],'y') eq 'y-1' ? "ok 4\n" : "not ok 4\n";
print &texpoly([2,1]) eq '2x+1' ? "ok 5\n" : "not ok 5\n";
print &texpoly([-2,1]) eq '-2x+1' ? "ok 6\n" : "not ok 6\n";
print &texpoly([-1..3]) eq '-x^{4}+x^{2}+2x+3' ? "ok 7\n" : "not ok 7\n";
print &texpoly([-1..3],'z') eq '-z^{4}+z^{2}+2z+3' ? "ok 8\n" : "not ok 8\n";
