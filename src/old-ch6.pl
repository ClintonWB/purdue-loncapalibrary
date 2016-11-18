sub round
{ my $number=$_[0]*&pow(10,$_[1]);
my $cutoff= int($number+.5*($number <=> 0));
return $cutoff/&pow(10,$_[1]);}
sub vn #input (i,n)
{(1+$_[0])**(-$_[1])};
sub sn #input (i,n)
{((1+$_[0])**($_[1])-1)/$_[0]};
sub anglea #input (i,n)
{(1-(1+$_[0])**(-$_[1]))/$_[0]};
sub addcomma
{ my $billion=&floor($_[0]/&pow(10,9));
my $million=&floor(($_[0]-$billion*&pow(10,9))/&pow(10,6));
my $thousand=&floor(($_[0]-$billion*&pow(10,9)-$million*&pow(10,6))/&pow(10,3));
my $hundred=$_[0]-$billion*(&pow(10,9))-$million*(&pow(10,6))-$thousand*(&pow(10,3));
my $millm=($million==0)?'000':($million<10)?'00'.$million:($million<100)?'0'.$million:$million;
my $thoum=($thousand==0)?'000':($thousand<10)?'00'.$thousand:($thousand<100)?'0'.$thousand:$thousand;
my $hundt=($hundred==0)? '000':($hundred<10)?'00'.$hundred:($hundred<100)?'0'.$hundred:$hundred;
return ($billion==0 && $million==0 && $thousand==0)? $hundred: ($billion==0 && $million==0)? $thousand.','.$hundt: ($billion==0)? $million.','.$thoum.','.$hundt: $billion.','.$millm.','.$thoum.','.$hundt;}

sub lastdigit
{ my $round=&round($_[0],-1);
  my $place=$_[0]-$round;
return ($place>=0)?$place:10+$place;}
sub tens
{ my $last=&lastdigit($_[0]);
  my $diff=$_[0]-$last;
  my $ten=&lastdigit($diff*.1);
return $ten*10+$last;}
sub stndrdth
{ my $k=&lastdigit($_[0]);
  my $n=&tens($_[0]);
return ($n==11 || $n==12 || $n==13)?'th':($k==1)?'st':($k==2)?'nd':($k==3)?'rd':'th';}

sub commadec 
{my $number=&round($_[0],2);
my $step1=&round($number-int($number),2);
my $step2=($step1==1)?'00':(100*$step1<10)?'0'.$step1*100:100*$step1;
my $step3=($step11==1)?int($number)+1:&int($number);
return &addcomma($step3).'.'.$step2;}

  <responseparam name="tol" type="tolerance" description="Numerical Tolerance" default=".01" />

<p style="text-align: center;">

$mword=($m==1)?'annual':($m==2)?'semi-annual':($m==4)?'quarter':($m==12)?'month':'hell if I know';
$mwordly=$mword.'ly';
$mpay=($m==1)?'year':($m==2)?'6 months':($m==4)?'3 months':($m==12)?'month':'sometime I guess';

sub numword #from 0 to 20
{($_[0]==0)?'zero':($_[0]==1)?'one':($_[0]==2)?'two':($_[0]==3)?'three':($_[0]==4)?'four':($_[0]==5)?'five':($_[0]==6)?'six':($_[0]==7)?'seven':($_[0]==8)?'eight':($_[0]==9)?'nine':($_[0]==10)?'ten':($_[0]==11)?'eleven':($_[0]==12)?'twelve':($_[0]==13)?'thirteen':($_[0]==14)?'fourteen':($_[0]==15)?'fifteen':($_[0]==16)?'sixteen':($_[0]==17)?'seventeen':($_[0]==18)?'eighteen':($_[0]==19)?'nineteen':'twenty'};
sub numwordst #from 0 to 20
{($_[0]==0)?'zeroth':($_[0]==1)?'first':($_[0]==2)?'second':($_[0]==3)?'third':($_[0]==4)?'fourth':($_[0]==5)?'fifth':($_[0]==6)?'sixth':($_[0]==7)?'seventh':($_[0]==8)?'eighth':($_[0]==9)?'ninth':($_[0]==10)?'tenth':($_[0]==11)?'eleventh':($_[0]==12)?'twelfth':($_[0]==13)?'thirteenth':($_[0]==14)?'fourteenth':($_[0]==15)?'fifteenth':($_[0]==16)?'sixteenth':($_[0]==17)?'seventeenth':($_[0]==18)?'eighteenth':($_[0]==19)?'nineteenth':'twentieth'};

sub numwordcap #from 0 to 20
{($_[0]==0)?'Zero':($_[0]==1)?'One':($_[0]==2)?'Two':($_[0]==3)?'Three':($_[0]==4)?'Four':($_[0]==5)?'Five':($_[0]==6)?'Six':($_[0]==7)?'Seven':($_[0]==8)?'Eight':($_[0]==9)?'Nine':($_[0]==10)?'Ten':($_[0]==11)?'Eleven':($_[0]==12)?'Twelve':($_[0]==13)?'Thirteen':($_[0]==14)?'Fourteen':($_[0]==15)?'Fifteen':($_[0]==16)?'Sixteen':($_[0]==17)?'Seventeen':($_[0]==18)?'Eighteen':($_[0]==19)?'Nineteen':'Twenty'};

sub mword
{($_[0]==1)?'annual':($_[0]==2)?'semi-annual':($_[0]==4)?'quarter':($_[0]==12)?'month':'hell if I know';}
sub mwordly
{&mword($_[0]).'ly';}
sub mw
{($_[0]==1||$_[0]==2)?&mword($_[0]):&mword($_[0]).'ly';}
sub mpay
{($_[0]==1)?'each year':($_[0]==2)?'every 6 months':($_[0]==4)?'every 3 months':($_[0]==12)?'each month':'sometime I guess';}

sub month
{($_[0]==1)?'January':($_[0]==2)?'February':($_[0]==3)?'March':($_[0]==4)?'April':($_[0]==5)?'May':($_[0]==6)?'June':($_[0]==7)?'July':($_[0]==8)?'August':($_[0]==9)?'September':($_[0]==10)?'October':($_[0]==11)?'November':'December';}

 <m>$a_{\overline{n}{\small|}i}$</m> or
 <m>$ a_{\overline{n}{\small|}}$</m>

sub sum #input (thing to sum, bottom exponent, top exponent) 
{for (my $i=$_[1]; $i<=$_[2]; $i++)
{$a=$a+($_[0]**($i));}
return $a;}
