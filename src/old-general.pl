sub dmult
{ ($_[0]==1)? "+":($_[0]>0)? "+$_[0]":($_[0]==-1)? "-":"$_[0]";}
sub dadd
{ ($_[0]==0)? "":($_[0]>0)? "+$_[0]":"$_[0]"; }
sub dmultfront
{ ($_[0]==1)? "":($_[0]>0)? "$_[0]":($_[0]==-1)? "-":"$_[0]";}
sub daddfront
{ ($_[0]==0)? "":"$_[0]"; }
sub avoidby
{ $case=$_[0]+$_[2];
($_[0]==$_[1])? "$case":"$_[0]";}
sub avoidzero
{avoidby($_[0],0,1);}
sub matchsign
{(($_[0])*($_[1])<0)?-$_[0]:"$_[0]";}
sub ltaddcomma
{ my $billion=&floor($_[0]/&pow(10,9));
my $million=&floor(($_[0]-$billion*&pow(10,9))/&pow(10,6));
my $thousand=&floor(($_[0]-$billion*&pow(10,9)-$million*&pow(10,6))/&pow(10,3));
my $hundred=$_[0]-$billion*(&pow(10,9))-$million*(&pow(10,6))-$thousand*(&pow(10,3));
my $millm=($million==0)?'000':($million<10)?'00'.$million:($million<100)?'0'.$million:$million;
my $thoum=($thousand==0)?'000':($thousand<10)?'00'.$thousand:($thousand<100)?'0'.$thousand:$thousand;
my $hundt=($hundred==0)? '000':($hundred<10)?'00'.$hundred:($hundred<100)?'0'.$hundred:$hundred;
return ($billion==0 && $million==0 && $thousand==0)? $hundred: ($billion==0 && $million==0)? $thousand.',\!'.$hundt: ($billion==0)? $million.',\!'.$thoum.',\!'.$hundt: $billion.',\!'.$millm.',\!'.$thoum.',\!'.$hundt;}

sub sign
{($_[0]>0)?"":($_[0]<0)?"-":'Error';}
sub red1
{ return $_[0]/&findgcd($_[0],$_[1]);}
sub red2
{ return $_[1]/&findgcd($_[0],$_[1]);}
sub redfrac
{
my $signfrac=((&red1($_[0],$_[1])>0 && &red2($_[0],$_[1])>0)|| (&red1($_[0],$_[1])<0 && &red2($_[0],$_[1])<0))? "":"-";
my $red1=&abs(&red1($_[0],$_[1]));
my $red2=&abs(&red2($_[0],$_[1]));
my $case1=$signfrac.$red1;
my $case2=$signfrac.'\frac{'.$red1.'}{'.$red2.'}';
return ($red2==1)? $case1:$case2;}
sub nozero
{my $binary=&random(0,1,1);
return ($binary==0)?&random($_[0],-1,$_[2]):&random(1,$_[1],$_[2]);}

sub round
{ my $number=$_[0]*&pow(10,$_[1]);
my $cutoff= int($number+.5*($number <=> 0));
return $cutoff/&pow(10,$_[1]);}

sub nosign
{($_[0]==0)?0:$_[0];}

sub findgcd
{
  my $s=($_[1]==0)? 1:$_[1];
  my $a=($_[0]==0)? $s: $_[0];
  my $b=($_[1]==0)? $a: $_[1];
  my @integers=($a,$b);
  my ($smaller, $larger) = (&min($a,$b),&max($a,$b));
  my $remainder = $larger%(($smaller==0)?$larger:$smaller);
  my $prev = $smaller;
  while($remainder != 0)
  {
    $smaller = $prev;
    $prev = $remainder;
    $remainder = $smaller%$prev;
  }
  $gcd = $prev;
  return ($_[0]==0 && $_[1]==0)? 0: $gcd;
}



sub round
{ my $number=$_[0]*&pow(10,$_[1]);
my $cutoff= int($number+.5*($number <=> 0));
return $cutoff/&pow(10,$_[1]);}
sub anglea #input (i,n)
{(1-(1+$_[0])**(-$_[1]))/$_[0]};
sub vn #input (i,n)
{(1+$_[0])**(-$_[1])};
sub dota #input (i,n)
{(1+$_[0])*&anglea($_[0],$_[1])};
sub im #input (i,m)
{$_[1]*(&pow(1+$_[0],1/$_[1])-1)};
sub imoverm #input (i,m)
{&im($_[0],$_[1])/$_[1]};
sub givenimoverm #input (imoverm,m)
{(1+$_[0])**($_[1])-1};
sub IA
{(&dota($_[0],$_[1])-$_[1]*&vn($_[0],$_[1]))/&imoverm($_[0],$_[2])};


sub addcomma
{ my $billion=&floor($_[0]/&pow(10,9));
my $million=&floor(($_[0]-$billion*&pow(10,9))/&pow(10,6));
my $thousand=&floor(($_[0]-$billion*&pow(10,9)-$million*&pow(10,6))/&pow(10,3));
my $hundred=$_[0]-$billion*(&pow(10,9))-$million*(&pow(10,6))-$thousand*(&pow(10,3));
my $millm=($million==0)?'000':($million<10)?'00'.$million:($million<100)?'0'.$million:$million;
my $thoum=($thousand==0)?'000':($thousand<10)?'00'.$thousand:($thousand<100)?'0'.$thousand:$thousand;
my $hundt=($hundred==0)? '000':($hundred<10)?'00'.$hundred:($hundred<100)?'0'.$hundred:$hundred;
return ($billion==0 && $million==0 && $thousand==0)? $hundred: ($billion==0 && $million==0)? $thousand.','.$hundt: ($billion==0)? $million.','.$thoum.','.$hundt: $billion.','.$millm.','.$thoum.','.$hundt;}
