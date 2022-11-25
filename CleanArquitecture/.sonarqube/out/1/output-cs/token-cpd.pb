å
mC:\cursos\CleanArquitecture\CleanArquitecture\CleanArquitecture.Application\ApplicationServiceRegistration.cs
	namespace 	
CleanArchitecture
 
. 
Application '
{ 
public		 

static		 
class		 *
ApplicationServiceRegistration		 6
{

 
public 
static 
IServiceCollection ("
AddApplicationServices) ?
(? @
this@ D
IServiceCollectionE W
servicesX `
)` a
{ 	
services 
. 
AddAutoMapper "
(" #
Assembly# +
.+ , 
GetExecutingAssembly, @
(@ A
)A B
)B C
;C D
services 
. %
AddValidatorsFromAssembly .
(. /
Assembly/ 7
.7 8 
GetExecutingAssembly8 L
(L M
)M N
)N O
;O P
services 
. 

AddMediatR 
(  
Assembly  (
.( ) 
GetExecutingAssembly) =
(= >
)> ?
)? @
;@ A
services 
. 
AddTransient !
(! "
typeof" (
(( )
IPipelineBehavior) :
<: ;
,; <
>< =
)= >
,> ?
typeof@ F
(F G'
UnhandledExceptionBehaviourG b
<b c
,c d
>d e
)e f
)f g
;g h
services 
. 
AddTransient !
(! "
typeof" (
(( )
IPipelineBehavior) :
<: ;
,; <
>< =
)= >
,> ?
typeof? E
(E F
ValidationBehaviourF Y
<Y Z
,Z [
>[ \
)\ ]
)] ^
;^ _
return 
services 
; 
} 	
} 
} ö
uC:\cursos\CleanArquitecture\CleanArquitecture\CleanArquitecture.Application\Behaviours\UnhandledExceptionBehaviour.cs
	namespace 	
CleanArchitecture
 
. 
Application '
.' (

Behaviours( 2
{ 
public 

class '
UnhandledExceptionBehaviour ,
<, -
TRequest- 5
,5 6
	TResponse7 @
>@ A
: 	
IPipelineBehavior	 
< 
TRequest #
,# $
	TResponse% .
>. /
where0 5
TRequest6 >
:> ?
IRequest@ H
<H I
	TResponseI R
>R S
{ 
private		 
readonly		 
ILogger		  
<		  !
TRequest		! )
>		) *
_logger		+ 2
;		2 3
public '
UnhandledExceptionBehaviour *
(* +
ILogger+ 2
<2 3
TRequest3 ;
>; <
logger= C
)C D
{ 	
_logger 
= 
logger 
; 
} 	
public 
async 
Task 
< 
	TResponse #
># $
Handle% +
(+ ,
TRequest, 4
request5 <
,< =
CancellationToken> O
cancellationTokenP a
,a b"
RequestHandlerDelegatec y
<y z
	TResponse	z É
>
É Ñ
next
Ö â
)
â ä
{ 	
try 
{ 
return 
await 
next !
(! "
)" #
;# $
} 
catch 
( 
	Exception 
ex 
)  
{ 
var 
requestName 
=  !
typeof" (
(( )
IRequest) 1
)1 2
.2 3
Name3 7
;7 8
_logger 
. 
LogError  
(  !
ex! #
,# $
$str% o
,o p
requestNamep {
,{ |
request	| É
)
É Ñ
;
Ñ Ö
throw 
; 
} 
} 	
} 
} Â
mC:\cursos\CleanArquitecture\CleanArquitecture\CleanArquitecture.Application\Behaviours\ValidationBehaviour.cs
	namespace 	
CleanArchitecture
 
. 
Application '
.' (

Behaviours( 2
{ 
public 

class 
ValidationBehaviour $
<$ %
TRequest% -
,- .
	TResponse/ 8
>8 9
:: ;
IPipelineBehavior 
< 
TRequest "
," #
	TResponse$ -
>- .
where/ 4
TRequest5 =
:= >
IRequest> F
<F G
	TResponseG P
>P Q
{		 
private 
readonly 
IEnumerable $
<$ %

IValidator% /
</ 0
TRequest0 8
>8 9
>9 :
_validators; F
;F G
public 
ValidationBehaviour "
(" #
IEnumerable# .
<. /

IValidator/ 9
<9 :
TRequest: B
>B C
>C D

validatorsE O
)O P
{ 	
_validators 
= 

validators $
;$ %
} 	
public 
async 
Task 
< 
	TResponse #
># $
Handle% +
(+ ,
TRequest, 4
request5 <
,< =
CancellationToken> O
cancellationTokenP a
,a b"
RequestHandlerDelegatec y
<y z
	TResponse	z É
>
É Ñ
next
Ö â
)
â ä
{ 	
if 
( 
_validators 
. 
Any 
(  
)  !
)! "
{ 
var 
context 
= 
new !
ValidationContext" 3
<3 4
TRequest4 <
>< =
(= >
request> E
)E F
;F G
var 
validationResults %
=& '
await( -
Task. 2
.2 3
WhenAll3 :
(: ;
_validators; F
.F G
SelectG M
(M N
vN O
=>P R
vS T
.T U
ValidateAsyncU b
(b c
contextc j
,j k
cancellationTokenk |
)| }
)} ~
)~ 
;	 Ä
var 
failures 
= 
validationResults .
.. /

SelectMany/ 9
(9 :
r: ;
=>< >
r? @
.@ A
ErrorsA G
)G H
.H I
WhereI N
(N O
fO P
=>Q S
fT U
!=V X
nullY ]
)] ^
.^ _
ToList_ e
(e f
)f g
;g h
if 
( 
failures 
. 
Count !
!=" $
$num% &
)& '
{ 
throw 
new 
ValidationException 1
(1 2
failures2 :
): ;
;; <
} 
} 
return 
await 
next 
( 
) 
;  
}   	
}!! 
}"" ˙
iC:\cursos\CleanArquitecture\CleanArquitecture\CleanArquitecture.Application\Constants\CustomClaimTypes.cs
	namespace 	
CleanArchitecture
 
. 
Application '
.' (
	Constants( 1
{ 
public 

static 
class 
CustomClaimTypes (
{ 
public 
const 
string 
Uid 
=  !
$str" '
;' (
} 
} ó
nC:\cursos\CleanArquitecture\CleanArquitecture\CleanArquitecture.Application\Contracts\Identity\IAuthService.cs
	namespace 	
CleanArchitecture
 
. 
Application '
.' (
	Contracts( 1
.1 2
Identity2 :
{ 
public 

	interface 
IAuthService !
{ 
Task 
< 
AuthResponse 
> 
Login  
(  !
AuthRequest! ,
request- 4
)4 5
;5 6
Task 
<  
RegistrationResponse !
>! "
Register# +
(+ ,
RegistrationRequest, ?
request@ G
)G H
;H I
}		 
}

 Œ
uC:\cursos\CleanArquitecture\CleanArquitecture\CleanArquitecture.Application\Contracts\Infrastructure\IEmailService.cs
	namespace 	
CleanArchitecture
 
. 
Application '
.' (
	Contracts( 1
.1 2
Infrastructure2 @
{ 
public 

	interface 
IEmailService "
{ 
Task 
< 
bool 
> 
	SendEmail 
( 
Email "
email# (
)( )
;) *
} 
}		 ä
uC:\cursos\CleanArquitecture\CleanArquitecture\CleanArquitecture.Application\Contracts\Persistence\IAsyncRepository.cs
	namespace 	
CleanArchitecture
 
. 
Application '
.' (
	Contracts( 1
.1 2
Persistence2 =
{ 
public 

	interface 
IAsyncRepository %
<% &
T& '
>' (
where) .
T/ 0
:1 2
BaseDomainModel3 B
{ 
Task 
< 
IReadOnlyList 
< 
T 
> 
> 
GetAllAsync *
(* +
)+ ,
;, -
Task		 
<		 
IReadOnlyList		 
<		 
T		 
>		 
>		 
GetAsync		 '
(		' (

Expression		( 2
<		2 3
Func		3 7
<		7 8
T		8 9
,		9 :
bool		: >
>		> ?
>		? @
	predicate		A J
)		J K
;		K L
Task

 
<

 
IReadOnlyList

 
<

 
T

 
>

 
>

 
GetAsync

 '
(

' (

Expression 
< 
Func 
< 
T 
, 
bool #
># $
>$ %
	predicate& /
=0 1
null2 6
,6 7
Func 
< 

IQueryable 
< 
T 
> 
, 
IOrderedQueryable  1
<1 2
T2 3
>3 4
>4 5
orderBy6 =
=> ?
null@ D
,D E
string 
includeString  
=! "
null# '
,' (
bool 
disabledTraking  
=  !
true! %
) 
; 
Task 
< 
IReadOnlyList 
< 
T 
> 
> 
GetAsync '
(' (

Expression 
< 
Func 
< 
T 
, 
bool #
># $
>$ %
	predicate& /
=0 1
null2 6
,6 7
Func 
< 

IQueryable 
< 
T 
> 
, 
IOrderedQueryable  1
<1 2
T2 3
>3 4
>4 5
orderBy6 =
=> ?
null@ D
,D E
List 
< 

Expression 
< 
Func  
<  !
T! "
," #
object# )
>) *
>* +
>+ ,
includes- 5
=6 7
null8 <
,< =
bool 
disabledTraking  
=! "
true# '
) 
; 
Task 
< 
T 
> 
GetByIdAsync 
( 
int  
id! #
)# $
;$ %
Task 
< 
T 
> 
AddAsync 
( 
T 
entity !
)! "
;" #
Task 
< 
T 
> 
UpdateAsync 
( 
T 
entity $
)$ %
;% &
Task 
DeleteAsync 
( 
T 
entity !
)! "
;" #
void 
	AddEntity 
( 
T 
entity 
)  
;  !
void 
UpdateEntity 
( 
T 
entity "
)" #
;# $
void 
DeleteEntity 
( 
T 
entity "
)" #
;# $
} 
} â
xC:\cursos\CleanArquitecture\CleanArquitecture\CleanArquitecture.Application\Contracts\Persistence\IStreamerRepository.cs
	namespace 	
CleanArchitecture
 
. 
Application '
.' (
	Contracts( 1
.1 2
Persistence2 =
{ 
public 

	interface 
IStreamerRepository (
:( )
IAsyncRepository* :
<: ;
Streamer; C
>C D
{ 
} 
} Ÿ
pC:\cursos\CleanArquitecture\CleanArquitecture\CleanArquitecture.Application\Contracts\Persistence\IUnitOfWork.cs
	namespace 	
CleanArchitecture
 
. 
Application '
.' (
	Contracts( 1
.1 2
Persistence2 =
{ 
public 

	interface 
IUnitOfWork  
:  !
IDisposable" -
{ 
IStreamerRepository 
StreamerRepository .
{/ 0
get1 4
;4 5
}6 7
IVideoRepository 
VideoRepository (
{) *
get+ .
;. /
}0 1
IAsyncRepository		 
<		 
TEntity		  
>		  !

Repository		" ,
<		, -
TEntity		- 4
>		4 5
(		5 6
)		6 7
where		8 =
TEntity		> E
:		F G
BaseDomainModel		H W
;		W X
Task

 
<

 
int

 
>

 
Complete

 
(

 
)

 
;

 
} 
} ®
uC:\cursos\CleanArquitecture\CleanArquitecture\CleanArquitecture.Application\Contracts\Persistence\IVideoRepository.cs
	namespace 	
CleanArchitecture
 
. 
Application '
.' (
	Contracts( 1
.1 2
Persistence2 =
{ 
public 

	interface 
IVideoRepository %
:% &
IAsyncRepository' 7
<7 8
Video8 =
>= >
{ 
Task 
< 
Video 
> 
GetVideoByName "
(" #
string# )
	nameVideo* 3
)3 4
;4 5
Task 
< 
IEnumerable 
< 
Video 
> 
>  
GetVideoByUserName! 3
(3 4
string4 :
username; C
)C D
;D E
}		 
}

 í
mC:\cursos\CleanArquitecture\CleanArquitecture\CleanArquitecture.Application\Excepions\BadRequestExceptions.cs
	namespace 	
CleanArchitecture
 
. 
Application '
.' (
	Excepions( 1
{ 
public 

class  
BadRequestExceptions %
:& ' 
ApplicationException( <
{ 
public  
BadRequestExceptions #
(# $
string$ *
message+ 2
)2 3
:3 4
base5 9
(9 :
message: A
)A B
{ 	
} 	
} 
}		 Ÿ
jC:\cursos\CleanArquitecture\CleanArquitecture\CleanArquitecture.Application\Excepions\NotFoundException.cs
	namespace 	
CleanArchitecture
 
. 
Application '
.' (
	Excepions( 1
{ 
public 

class 
NotFoundException #
:# $ 
ApplicationException% 9
{ 
public 
NotFoundException  
(  !
string! '
name( ,
,, -
object. 4
key5 8
)8 9
:9 :
base; ?
(? @
$"@ B
$strB K
{K L
nameL P
}P Q
$strQ U
{U V
keyV Y
}Y Z
$strZ m
"m n
)n o
{ 	
} 	
}		 
}

 Ü
lC:\cursos\CleanArquitecture\CleanArquitecture\CleanArquitecture.Application\Excepions\ValidationException.cs
	namespace 	
CleanArchitecture
 
. 
Application '
.' (
	Excepions( 1
{ 
public 

class 
ValidationException $
:$ % 
ApplicationException% 9
{ 
public 
IDictionary 
< 
string !
,! "
string# )
[) *
]* +
>+ ,
Errors- 3
{4 5
get6 9
;9 :
set; >
;> ?
}@ A
public

 
ValidationException

 "
(

" #
)

# $
:

$ %
base

& *
(

* +
$str

+ [
)

[ \
{ 	
Errors 
= 
new 

Dictionary #
<# $
string$ *
,* +
string, 2
[2 3
]3 4
>4 5
(5 6
)6 7
;7 8
} 	
public 
ValidationException "
(" #
IEnumerable# .
<. /
ValidationFailure/ @
>@ A
failuresB J
)J K
:K L
thisL P
(P Q
)Q R
{ 	
Errors 
= 
failures 
. 
GroupBy 
( 
e 
=> 
e 
.  
PropertyName  ,
,, -
e. /
=>0 2
e3 4
.4 5
ErrorMessage5 A
)A B
. 
ToDictionary 
( 
failureGroup *
=>+ -
failureGroup. :
.: ;
Key; >
,> ?
failiureGroup@ M
=>N P
failiureGroupQ ^
.^ _
ToArray_ f
(f g
)g h
)h i
;i j
} 	
} 
} ’	
èC:\cursos\CleanArquitecture\CleanArquitecture\CleanArquitecture.Application\Features\Directors\Commands\CreateDirector\CreateDirectorCommand.cs
	namespace 	
CleanArchitecture
 
. 
Application '
.' (
Features( 0
.0 1
	Directors1 :
.: ;
Commands; C
.C D
CreateDirectorD R
{ 
public 

class !
CreateDirectorCommand &
:& '
IRequest' /
</ 0
int0 3
>3 4
{ 
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
=+ ,
string- 3
.3 4
Empty4 9
;9 :
public 
string 
Apellido 
{  
get! $
;$ %
set& )
;) *
}+ ,
=, -
string. 4
.4 5
Empty5 :
;: ;
public		 
int		 
VideoId		 
{		 
get		  
;		  !
set		" %
;		% &
}		' (
}

 
} è
ñC:\cursos\CleanArquitecture\CleanArquitecture\CleanArquitecture.Application\Features\Directors\Commands\CreateDirector\CreateDirectorCommandHandler.cs
	namespace 	
CleanArchitecture
 
. 
Application '
.' (
Features( 0
.0 1
	Directors1 :
.: ;
Commands; C
.C D
CreateDirectorD R
{ 
public		 

class		 (
CreateDirectorCommandHandler		 -
:		. /
IRequestHandler		0 ?
<		? @!
CreateDirectorCommand		@ U
,		U V
int		W Z
>		Z [
{

 
private 
readonly 
ILogger  
<  !(
CreateDirectorCommandHandler! =
>= >
_logger? F
;F G
private 
readonly 
IMapper  
_mapper! (
;( )
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
public (
CreateDirectorCommandHandler +
(+ ,
ILogger, 3
<3 4(
CreateDirectorCommandHandler4 P
>P Q
loggerR X
,X Y
IMapperZ a
mapperb h
,h i
IUnitOfWorkj u

unitOfWork	v Ä
)
Ä Å
{ 	
_logger 
= 
logger 
; 
_mapper 
= 
mapper 
; 
_unitOfWork 
= 

unitOfWork $
;$ %
} 	
public 
async 
Task 
< 
int 
> 
Handle %
(% &!
CreateDirectorCommand& ;
request< C
,C D
CancellationTokenE V
cancellationTokenW h
)h i
{ 	
var 
directorEntity 
=  
_mapper! (
.( )
Map) ,
<, -
Director- 5
>5 6
(6 7
request7 >
)> ?
;? @
_unitOfWork 
. 

Repository "
<" #
Director# +
>+ ,
(, -
)- .
.. /
	AddEntity/ 8
(8 9
directorEntity9 G
)G H
;H I
var 
result 
= 
await 
_unitOfWork *
.* +
Complete+ 3
(3 4
)4 5
;5 6
if 
( 
result 
<= 
$num 
) 
{ 
_logger 
. 
LogError  
(  !
$str! I
)I J
;J K
throw 
new 
	Exception #
(# $
$str$ R
)R S
;S T
} 
return!! 
directorEntity!! !
.!!! "
Id!!" $
;!!$ %
}"" 	
}## 
}$$ ‰

òC:\cursos\CleanArquitecture\CleanArquitecture\CleanArquitecture.Application\Features\Directors\Commands\CreateDirector\CreateDirectorCommandValidator.cs
	namespace 	
CleanArchitecture
 
. 
Application '
.' (
Features( 0
.0 1
	Directors1 :
.: ;
Commands; C
.C D
CreateDirectorD R
{ 
public 

class *
CreateDirectorCommandValidator /
:/ 0
AbstractValidator0 A
<A B!
CreateDirectorCommandB W
>W X
{ 
public *
CreateDirectorCommandValidator -
(- .
). /
{ 	
RuleFor		 
(		 
p		 
=>		 
p		 
.		 
Nombre		 !
)		! "
.

 
NotNull

 
(

 
)

 
.

 
WithMessage

 &
(

& '
$str

' C
)

C D
;

D E
RuleFor 
( 
p 
=> 
p 
. 
Apellido #
)# $
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' E
)E F
;F G
} 	
} 
} ∏
èC:\cursos\CleanArquitecture\CleanArquitecture\CleanArquitecture.Application\Features\Streamers\Commands\CreateStreamer\CreateStreamerCommand.cs
	namespace 	
CleanArchitecture
 
. 
Application '
.' (
Features( 0
.0 1
	Streamers1 :
.: ;
Commands; C
.C D
CreateStreamerD R
{ 
public 

class !
CreateStreamerCommand &
:' (
IRequest) 1
<1 2
int2 5
>5 6
{ 
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
=+ ,
string- 3
.3 4
Empty4 9
;9 :
public 
string 
Url 
{ 
get 
;  
set! $
;$ %
}& '
=( )
string* 0
.0 1
Empty1 6
;6 7
}		 
}

 Â#
ñC:\cursos\CleanArquitecture\CleanArquitecture\CleanArquitecture.Application\Features\Streamers\Commands\CreateStreamer\CreateStreamerCommandHandler.cs
	namespace		 	
CleanArchitecture		
 
.		 
Application		 '
.		' (
Features		( 0
.		0 1
	Streamers		1 :
.		: ;
Commands		; C
.		C D
CreateStreamer		D R
{

 
public 

class (
CreateStreamerCommandHandler -
:. /
IRequestHandler0 ?
<? @!
CreateStreamerCommand@ U
,U V
intW Z
>Z [
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
IMapper  
_mapper! (
;( )
private 
readonly 
IEmailService &
_emailService' 4
;4 5
private 
readonly 
ILogger  
<  !(
CreateStreamerCommandHandler! =
>= >
_logger? F
;F G
public (
CreateStreamerCommandHandler +
(+ ,
IUnitOfWork, 7

unitOfWork8 B
,B C
IMapper 
mapper 
, 
IEmailService 
emailService &
,& '
ILogger 
< (
CreateStreamerCommandHandler 0
>0 1
logger2 8
)8 9
{ 	
_unitOfWork 
= 

unitOfWork $
;$ %
_mapper 
= 
mapper 
; 
_emailService 
= 
emailService (
;( )
_logger 
= 
logger 
; 
} 	
public 
async 
Task 
< 
int 
> 
Handle %
(% &!
CreateStreamerCommand& ;
request< C
,C D
CancellationTokenE V
cancellationTokenW h
)h i
{   	
var!! 
streamerEntity!! 
=!!  
_mapper!!! (
.!!( )
Map!!) ,
<!!, -
Streamer!!- 5
>!!5 6
(!!6 7
request!!7 >
)!!> ?
;!!? @
_unitOfWork## 
.## 
StreamerRepository## *
.##* +
	AddEntity##+ 4
(##4 5
streamerEntity##5 C
)##C D
;##D E
var$$ 
result$$ 
=$$ 
await$$ 
_unitOfWork$$ )
.$$) *
Complete$$* 2
($$2 3
)$$3 4
;$$4 5
if&& 
(&& 
result&& 
<=&& 
$num&& 
)&& 
{'' 
throw(( 
new(( 
	Exception(( #
(((# $
$str(($ O
)((O P
;((P Q
})) 
_logger++ 
.++ 
LogInformation++ "
(++" #
$"++# %
$str++% .
{++. /
streamerEntity++/ =
.++= >
Id++> @
}++@ A
$str++A Y
"++Y Z
)++Z [
;++[ \
await-- 
	SendEmail-- 
(-- 
streamerEntity-- *
)--* +
;--+ ,
return// 
streamerEntity// !
.//! "
Id//" $
;//$ %
}00 	
private22 
async22 
Task22 
	SendEmail22 $
(22$ %
Streamer22% -
streamer22. 6
)226 7
{33 	
var44 
email44 
=44 
new44 
Email44 !
{55 
To66 
=66 
$str66 (
,66( )
Subject77 
=77 
$str77 -
,77- .
Body88 
=88 
$str88 F
}99 
;99 
try:: 
{;; 
await<< 
_emailService<< #
.<<# $
	SendEmail<<$ -
(<<- .
email<<. 3
)<<3 4
;<<4 5
}== 
catch>> 
(>> 
	Exception>> 
ex>> 
)>>  
{?? 
_logger@@ 
.@@ 
LogError@@  
(@@  !
$"@@! #
$str@@# @
{@@@ A
streamer@@A I
.@@I J
Id@@J L
}@@L M
"@@M N
)@@N O
;@@O P
}AA 
}CC 	
}DD 
}EE ’
òC:\cursos\CleanArquitecture\CleanArquitecture\CleanArquitecture.Application\Features\Streamers\Commands\CreateStreamer\CreateStreamerCommandValidator.cs
	namespace 	
CleanArchitecture
 
. 
Application '
.' (
Features( 0
.0 1
	Streamers1 :
.: ;
Commands; C
.C D
CreateStreamerD R
{ 
public 

class *
CreateStreamerCommandValidator /
:0 1
AbstractValidator2 C
<C D!
CreateStreamerCommandD Y
>Y Z
{ 
public *
CreateStreamerCommandValidator -
(- .
). /
{ 	
RuleFor		 
(		 
p		 
=>		 
p		 
.		 
Nombre		 !
)		! "
.

 
NotEmpty

 
(

 
)

 
.

 
WithMessage

 '
(

' (
$str

( K
)

K L
. 
NotNull 
( 
) 
. 
MaximumLength 
( 
$num !
)! "
." #
WithMessage# .
(. /
$str/ [
)[ \
;\ ]
RuleFor 
( 
p 
=> 
p 
. 
Url 
) 
. 
NotEmpty 
( 
) 
. 
WithMessage '
(' (
$str( K
)K L
;L M
} 	
} 
} √
èC:\cursos\CleanArquitecture\CleanArquitecture\CleanArquitecture.Application\Features\Streamers\Commands\DeleteStreamer\DeleteStreamerCommand.cs
	namespace 	
CleanArchitecture
 
. 
Application '
.' (
Features( 0
.0 1
	Streamers1 :
.: ;
Commands; C
.C D
DeleteStreamerD R
{ 
public 

class !
DeleteStreamerCommand &
:& '
IRequest( 0
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
} 
}		 ™
ñC:\cursos\CleanArquitecture\CleanArquitecture\CleanArquitecture.Application\Features\Streamers\Commands\DeleteStreamer\DeleteStreamerCommandHandler.cs
	namespace 	
CleanArchitecture
 
. 
Application '
.' (
Features( 0
.0 1
	Streamers1 :
.: ;
Commands; C
.C D
DeleteStreamerD R
{		 
public 

class (
DeleteStreamerCommandHandler -
:. /
IRequestHandler0 ?
<? @!
DeleteStreamerCommand@ U
>U V
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
IMapper  
_mapper! (
;( )
private 
readonly 
ILogger  
<  !(
DeleteStreamerCommandHandler! =
>= >
_logger? F
;F G
public (
DeleteStreamerCommandHandler +
(+ ,
IUnitOfWork, 7

unitOfWork8 B
,B C
IMapperD K
mapperL R
,R S
ILoggerT [
<[ \(
DeleteStreamerCommandHandler\ x
>x y
logger	z Ä
)
Ä Å
{ 	
_unitOfWork 
= 

unitOfWork $
;$ %
_mapper 
= 
mapper 
; 
_logger 
= 
logger 
; 
} 	
public 
async 
Task 
< 
Unit 
> 
Handle  &
(& '!
DeleteStreamerCommand' <
request= D
,D E
CancellationTokenF W
cancellationTokenX i
)i j
{ 	
var 
streamerToDelete  
=! "
await# (
_unitOfWork) 4
. 
StreamerRepository #
. 
GetByIdAsync 
( 
request %
.% &
Id& (
)( )
;) *
if 
( 
streamerToDelete  
==! #
null$ (
)( )
{* +
_logger   
.   
LogError    
(    !
$"  ! #
{  # $
request  $ +
.  + ,
Id  , .
}  . /
$str  / O
"  O P
)  P Q
;  Q R
throw!! 
new!! 
NotFoundException!! +
(!!+ ,
nameof!!, 2
(!!2 3
Streamer!!3 ;
)!!; <
,!!< =
request!!> E
.!!E F
Id!!F H
)!!H I
;!!I J
}"" 
_unitOfWork$$ 
.$$ 
StreamerRepository$$ *
.$$* +
DeleteEntity$$+ 7
($$7 8
streamerToDelete$$8 H
)$$H I
;$$I J
await%% 
_unitOfWork%% 
.%% 
Complete%% &
(%%& '
)%%' (
;%%( )
_logger&& 
.&& 
LogInformation&& "
(&&" #
$"&&# %
$str&&% (
{&&( )
request&&) 0
.&&0 1
Id&&1 3
}&&3 4
$str&&4 U
"&&U V
)&&V W
;&&W X
return'' 
Unit'' 
.'' 
Value'' 
;'' 
}(( 	
})) 
}** ú	
èC:\cursos\CleanArquitecture\CleanArquitecture\CleanArquitecture.Application\Features\Streamers\Commands\UpdateStreamer\UpdateStreamerCommand.cs
	namespace 	
CleanArchitecture
 
. 
Application '
.' (
Features( 0
.0 1
	Streamers1 :
.: ;
Commands; C
.C D
UpdateStreamerD R
{ 
public 

class !
UpdateStreamerCommand &
:& '
IRequest' /
{ 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
=+ ,
string- 3
.3 4
Empty4 9
;9 :
public		 
string		 
Url		 
{		 
get		 
;		  
set		! $
;		$ %
}		& '
=		( )
string		* 0
.		0 1
Empty		1 6
;		6 7
}

 
} â
ñC:\cursos\CleanArquitecture\CleanArquitecture\CleanArquitecture.Application\Features\Streamers\Commands\UpdateStreamer\UpdateStreamerCommandHandler.cs
	namespace 	
CleanArchitecture
 
. 
Application '
.' (
Features( 0
.0 1
	Streamers1 :
.: ;
Commands; C
.C D
UpdateStreamerD R
{		 
public

 

class

 (
UpdateStreamerCommandHandler

 -
:

. /
IRequestHandler

0 ?
<

? @!
UpdateStreamerCommand

@ U
>

U V
{ 
private 
readonly 
IUnitOfWork $
_unitOfWork% 0
;0 1
private 
readonly 
IMapper  
_mapper! (
;( )
private 
readonly 
ILogger  
<  !(
UpdateStreamerCommandHandler! =
>= >
_logger? F
;F G
public (
UpdateStreamerCommandHandler +
(+ ,
IUnitOfWork, 7

unitOfWork8 B
,B C
IMapperD K
mapperL R
,R S
ILoggerT [
<[ \(
UpdateStreamerCommandHandler\ x
>x y
logger	z Ä
)
Ä Å
{ 	
_unitOfWork 
= 

unitOfWork $
;$ %
_mapper 
= 
mapper 
; 
_logger 
= 
logger 
; 
} 	
public 
async 
Task 
< 
Unit 
> 
Handle  &
(& '!
UpdateStreamerCommand' <
request= D
,D E
CancellationTokenF W
cancellationTokenX i
)i j
{ 	
var 
streamerToUpdate  
=! "
await# (
_unitOfWork) 4
.4 5
StreamerRepository5 G
.G H
GetByIdAsyncH T
(T U
requestU \
.\ ]
Id] _
)_ `
;` a
if 
( 
streamerToUpdate  
==! #
null$ (
)( )
{ 
_logger 
. 
LogError  
(  !
$"! #
$str# A
{A B
requestB I
.I J
IdJ L
}L M
"M N
)N O
;O P
throw   
new   
NotFoundException   +
(  + ,
nameof  , 2
(  2 3
Streamer  3 ;
)  ; <
,  < =
request  > E
.  E F
Id  F H
)  H I
;  I J
}!! 
_mapper## 
.## 
Map## 
(## 
request## 
,##  
streamerToUpdate##! 1
,##1 2
typeof##3 9
(##9 :!
UpdateStreamerCommand##: O
)##O P
,##P Q
typeof##R X
(##X Y
Streamer##Y a
)##a b
)##b c
;##c d
_unitOfWork&& 
.&& 
StreamerRepository&& *
.&&* +
UpdateEntity&&+ 7
(&&7 8
streamerToUpdate&&8 H
)&&H I
;&&I J
await'' 
_unitOfWork'' 
.'' 
Complete'' &
(''& '
)''' (
;''( )
_logger(( 
.(( 
LogInformation(( "
(((" #
$"((# %
$str((% W
{((W X
request((X _
.((_ `
Id((` b
}((b c
$str((c d
"((d e
)((e f
;((f g
return** 
Unit** 
.** 
Value** 
;** 
}++ 	
},, 
}-- ﬂ

òC:\cursos\CleanArquitecture\CleanArquitecture\CleanArquitecture.Application\Features\Streamers\Commands\UpdateStreamer\UpdateStreamerCommandValidator.cs
	namespace 	
CleanArchitecture
 
. 
Application '
.' (
Features( 0
.0 1
	Streamers1 :
.: ;
Commands; C
.C D
UpdateStreamerD R
{ 
public 

class *
UpdateStreamerCommandValidator /
:/ 0
AbstractValidator1 B
<B C!
UpdateStreamerCommandC X
>X Y
{ 
public *
UpdateStreamerCommandValidator -
(- .
). /
{ 	
RuleFor		 
(		 
p		 
=>		 
p		 
.		 
Nombre		 !
)		! "
.

 
NotNull

 
(

 
)

 
.

 
WithMessage

 &
(

& '
$str

' J
)

J K
;

K L
RuleFor 
( 
p 
=> 
p 
. 
Url 
) 
. 
NotNull 
( 
) 
. 
WithMessage &
(& '
$str' G
)G H
;H I
} 	
} 
} ó

áC:\cursos\CleanArquitecture\CleanArquitecture\CleanArquitecture.Application\Features\Videos\Queries\GetVideosList\GetVideosListQuery.cs
	namespace 	
CleanArchitecture
 
. 
Application '
.' (
Features( 0
.0 1
Videos1 7
.7 8
Queries8 ?
.? @
GetVideosList@ M
{ 
public 

class 
GetVideosListQuery #
:# $
IRequest% -
<- .
List. 2
<2 3
VideosVm3 ;
>; <
>< =
{ 
public 
string 
	_Username 
{  !
get" %
;% &
set' *
;* +
}, -
=. /
String0 6
.6 7
Empty7 <
;< =
public 
GetVideosListQuery !
(! "
string" (
username) 1
)1 2
{		 	
	_Username

 
=

 
username

  
??

! #
throw

$ )
new

* -!
ArgumentNullException

. C
(

C D
nameof

D J
(

J K
username

K S
)

S T
)

T U
;

U V
} 	
} 
} í
éC:\cursos\CleanArquitecture\CleanArquitecture\CleanArquitecture.Application\Features\Videos\Queries\GetVideosList\GetVideosListQueryHandler.cs
	namespace 	
CleanArchitecture
 
. 
Application '
.' (
Features( 0
.0 1
Videos1 7
.7 8
Queries8 ?
.? @
GetVideosList@ M
{ 
public 

class %
GetVideosListQueryHandler *
:+ ,
IRequestHandler- <
<< =
GetVideosListQuery= O
,O P
ListQ U
<U V
VideosVmV ^
>^ _
>_ `
{ 
private

 
readonly

 
IUnitOfWork

 $
_unitOfWork

% 0
;

0 1
private 
readonly 
IMapper  
_mapper! (
;( )
public %
GetVideosListQueryHandler (
(( )
IUnitOfWork) 4

unitOfWork5 ?
,? @
IMapperA H
mapperI O
)O P
{ 	
_unitOfWork 
= 

unitOfWork $
;$ %
_mapper 
= 
mapper 
; 
} 	
public 
async 
Task 
< 
List 
< 
VideosVm '
>' (
>( )
Handle* 0
(0 1
GetVideosListQuery1 C
requestD K
,K L
CancellationTokenM ^
cancellationToken_ p
)p q
{ 	
var 
videList 
= 
await  
_unitOfWork! ,
. 
VideoRepository  
. 
GetVideoByUserName #
(# $
request$ +
.+ ,
	_Username, 5
)5 6
;6 7
return 
_mapper 
. 
Map 
< 
List #
<# $
VideosVm$ ,
>, -
>- .
(. /
videList/ 7
)7 8
;8 9
} 	
} 
} ™
}C:\cursos\CleanArquitecture\CleanArquitecture\CleanArquitecture.Application\Features\Videos\Queries\GetVideosList\VideosVm.cs
	namespace 	
CleanArchitecture
 
. 
Application '
.' (
Features( 0
.0 1
Videos1 7
.7 8
Queries8 ?
.? @
GetVideosList@ M
{ 
public 

class 
VideosVm 
{ 
public 
string 
? 
Nombre 
{ 
get  #
;# $
set% (
;( )
}* +
public 
int 

StreamerId 
{ 
get  #
;# $
set% (
;( )
}* +
}

 
} å	
fC:\cursos\CleanArquitecture\CleanArquitecture\CleanArquitecture.Application\Mappings\MappingProfile.cs
	namespace 	
CleanArchitecture
 
. 
Application '
.' (
Mappings( 0
{		 
public

 

class

 
MappingProfile

 
:

  
Profile

! (
{ 
public 
MappingProfile 
( 
) 
{ 	
	CreateMap 
< 
Video 
, 
VideosVm %
>% &
(& '
)' (
;( )
	CreateMap 
< !
CreateStreamerCommand +
,+ ,
Streamer- 5
>5 6
(6 7
)7 8
;8 9
	CreateMap 
< !
UpdateStreamerCommand +
,+ ,
Streamer- 5
>5 6
(6 7
)7 8
;8 9
	CreateMap 
< !
CreateDirectorCommand +
,+ ,
Director- 5
>5 6
(6 7
)7 8
;8 9
} 	
} 
} ó
[C:\cursos\CleanArquitecture\CleanArquitecture\CleanArquitecture.Application\Models\Email.cs
	namespace 	
CleanArchitecture
 
. 
Application '
.' (
Models( .
{ 
public 

class 
Email 
{ 
public 
string 
To 
{ 
get 
; 
set  #
;# $
}% &
public 
string 
Subject 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
Body 
{ 
get  
;  !
set" %
;% &
}' (
} 
}		 ≥
cC:\cursos\CleanArquitecture\CleanArquitecture\CleanArquitecture.Application\Models\EmailSettings.cs
	namespace 	
CleanArchitecture
 
. 
Application '
.' (
Models( .
{ 
public 

class 
EmailSettings 
{ 
public 
string 
ApiKey 
{ 
get "
;" #
set$ '
;' (
}) *
public 
string 
FromAddress !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
FromName 
{  
get! $
;$ %
set& )
;) *
}+ ,
}		 
}

 Â
jC:\cursos\CleanArquitecture\CleanArquitecture\CleanArquitecture.Application\Models\Identity\AuthRequest.cs
	namespace 	
CleanArchitecture
 
. 
Application '
.' (
Models( .
.. /
Identity/ 7
{ 
public 

class 
AuthRequest 
{ 
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
string/ 5
.5 6
Empty6 ;
;; <
} 
} æ

kC:\cursos\CleanArquitecture\CleanArquitecture\CleanArquitecture.Application\Models\Identity\AuthResponse.cs
	namespace 	
CleanArchitecture
 
. 
Application '
.' (
Models( .
.. /
Identity/ 7
{ 
public 

class 
AuthResponse 
{ 
public 
string 
Id 
{ 
get 
; 
set  #
;# $
}% &
=' (
string) /
./ 0
Empty0 5
;5 6
public 
string 
UserName 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
string/ 5
.5 6
Empty6 ;
;; <
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
public 
string 
Token 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
}		 
}

 ˆ	
jC:\cursos\CleanArquitecture\CleanArquitecture\CleanArquitecture.Application\Models\Identity\JwtSettings.cs
	namespace 	
CleanArchitecture
 
. 
Application '
.' (
Models( .
.. /
Identity/ 7
{ 
public 

class 
JwtSettings 
{ 
public 
string 
Key 
{ 
get 
;  
set! $
;$ %
}& '
=( )
string* 0
.0 1
Empty1 6
;6 7
public 
string 
Issuer 
{ 
get "
;" #
set$ '
;' (
}) *
=+ ,
string- 3
.3 4
Empty4 9
;9 :
public 
string 
Audience 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
string/ 5
.5 6
Empty6 ;
;; <
public 
double 
DurationInMinutes '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
}		 
}

 ƒ
rC:\cursos\CleanArquitecture\CleanArquitecture\CleanArquitecture.Application\Models\Identity\RegistrationRequest.cs
	namespace 	
CleanArchitecture
 
. 
Application '
.' (
Models( .
.. /
Identity/ 7
{ 
public 

class 
RegistrationRequest $
{ 
public 
string 
Nombre 
{ 
get "
;" #
set$ '
;' (
}) *
=+ ,
string- 3
.3 4
Empty4 9
;9 :
public 
string 
	Apellidos 
{  !
get" %
;% &
set' *
;* +
}, -
=. /
string0 6
.6 7
Empty7 <
;< =
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
public 
string 
UserName 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
string/ 5
.5 6
Empty6 ;
;; <
public		 
string		 
Password		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
=		- .
string		/ 5
.		5 6
Empty		6 ;
;		; <
} 
} “

sC:\cursos\CleanArquitecture\CleanArquitecture\CleanArquitecture.Application\Models\Identity\RegistrationResponse.cs
	namespace 	
CleanArchitecture
 
. 
Application '
.' (
Models( .
.. /
Identity/ 7
{ 
public 

class  
RegistrationResponse %
{ 
public 
string 
UserId 
{ 
get "
;" #
set$ '
;' (
}) *
=+ ,
string- 3
.3 4
Empty4 9
;9 :
public 
string 
UserName 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
string/ 5
.5 6
Empty6 ;
;; <
public 
string 
Email 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
public 
string 
Token 
{ 
get !
;! "
set# &
;& '
}( )
=* +
string, 2
.2 3
Empty3 8
;8 9
}		 
}

 