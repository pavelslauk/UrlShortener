£
GD:\temp\UrlShortener\UrlShortener.Application\Interfaces\IUrlService.cs
	namespace 	
UrlShortener
 
. 
Application "
." #

Interfaces# -
{ 
public 

	interface 
IUrlService  
{ 
IEnumerable		 
<		 
UrlModel		 
>		 
GetUrlViewModel		 -
(		- .
)		. /
;		/ 0
void 
	CreateUrl 
( 
string 

newUserUrl (
)( )
;) *
bool 
	TryGetUrl 
( 
string 
shortedUrlPart ,
,, -
out. 1
Url2 5
url6 9
)9 :
;: ;
void 
UpdateClickedUrl 
( 
Url !
url" %
)% &
;& '
} 
} ¢
@D:\temp\UrlShortener\UrlShortener.Application\Models\UrlModel.cs
	namespace 	
UrlShortener
 
. 
Application "
." #
Models# )
{ 
public 

class 
UrlModel 
{ 
public 
int 
? 
Id 
{ 
get 
; 
set !
;! "
}# $
public 
string 
UserUrl 
{ 
get  #
;# $
set% (
;( )
}* +
public		 
string		 

ShortedUrl		  
{		! "
get		# &
;		& '
set		( +
;		+ ,
}		- .
public 
int 
Clics 
{ 
get 
; 
set  #
;# $
}% &
} 
} ‘.
DD:\temp\UrlShortener\UrlShortener.Application\Services\UrlService.cs
	namespace

 	
UrlShortener


 
.

 
Application

 "
.

" #
Services

# +
{ 
public 

class 

UrlService 
: 
IUrlService )
{ 
const 
string 
charsForRandomUrl &
=' (
$str) i
;i j
private 
readonly 
IContextWorker '
_contextWorker( 6
;6 7
private 
readonly 
IRepository $
<$ %
Url% (
>( )
_urlsRepository* 9
;9 :
private 
readonly 
IMapper  
_mapper! (
;( )
public 

UrlService 
( 
IContextWorker (
contextWorker) 6
,6 7
IRepository8 C
<C D
UrlD G
>G H
urlsRepositoryI W
,W X
IMapperY `
mappera g
)g h
{ 	
_contextWorker 
= 
contextWorker *
;* +
_urlsRepository 
= 
urlsRepository ,
;, -
_mapper 
= 
mapper 
; 
} 	
public 
IEnumerable 
< 
UrlModel #
># $
GetUrlViewModel% 4
(4 5
)5 6
{ 	
var 
urlViewModelList  
=! "
_mapper# *
.* +
Map+ .
<. /
IEnumerable/ :
<: ;
Url; >
>> ?
,? @
ListA E
<E F
UrlModelF N
>N O
>O P
(P Q
_urlsRepositoryQ `
.` a
GetAlla g
(g h
)h i
)i j
;j k
urlViewModelList 
. 
Add  
(  !
new! $
UrlModel% -
{. /
Id0 2
=3 4
null5 9
}: ;
); <
;< =
return   
urlViewModelList   #
;  # $
}!! 	
public## 
void## 
	CreateUrl## 
(## 
string## $

newUserUrl##% /
)##/ 0
{$$ 	
var%% 
newUrl%% 
=%% 
new%% 
Url%%  
{%%! "
UserUrl%%# *
=%%+ ,

newUserUrl%%- 7
,%%7 8
Clics%%9 >
=%%? @
$num%%A B
}%%C D
;%%D E
newUrl&& 
.&& 

ShortedUrl&& 
=&& 
CreateShortedUrl&&  0
(&&0 1
)&&1 2
;&&2 3
_urlsRepository'' 
.'' 
Add'' 
(''  
newUrl''  &
)''& '
;''' (
_contextWorker)) 
.)) 
Commit)) !
())! "
)))" #
;))# $
}** 	
public,, 
bool,, 
	TryGetUrl,, 
(,, 
string,, $
shortedUrlPart,,% 3
,,,3 4
out,,5 8
Url,,9 <
url,,= @
),,@ A
{-- 	
var.. 
urls.. 
=.. 
_urlsRepository.. &
...& '
Find..' +
(..+ ,
url.., /
=>..0 2
url..3 6
...6 7

ShortedUrl..7 A
...A B
Contains..B J
(..J K
shortedUrlPart..K Y
)..Y Z
)..Z [
;..[ \
url// 
=// 
urls// 
.// 
FirstOrDefault// %
(//% &
)//& '
;//' (
return11 
urls11 
.11 
Any11 
(11 
)11 
;11 
}22 	
public44 
void44 
UpdateClickedUrl44 $
(44$ %
Url44% (
url44) ,
)44, -
{55 	
url66 
.66 
Clics66 
++66 
;66 
_urlsRepository77 
.77 
Update77 "
(77" #
url77# &
)77& '
;77' (
_contextWorker99 
.99 
Commit99 !
(99! "
)99" #
;99# $
}:: 	
private<< 
string<< 
CreateShortedUrl<< '
(<<' (
)<<( )
{== 	
string>> 

shortedUrl>> 
;>> 
do@@ 
{AA 

shortedUrlBB 
=BB 
GetRandomStringBB ,
(BB, -
)BB- .
;BB. /
}CC 
whileDD 
(DD 
	TryGetUrlDD 
(DD 

shortedUrlDD '
,DD' (
outDD) ,
_DD- .
)DD. /
)DD/ 0
;DD0 1
returnFF 

shortedUrlFF 
;FF 
}GG 	
privateII 
stringII 
GetRandomStringII &
(II& '
)II' (
{JJ 	
RandomKK 
randomKK 
=KK 
newKK 
RandomKK  &
(KK& '
)KK' (
;KK( )
returnMM 
newMM 
stringMM 
(MM 

EnumerableMM (
.MM( )
RepeatMM) /
(MM/ 0
charsForRandomUrlMM0 A
,MMA B
$numMMC D
)MMD E
.NN 
SelectNN 
(NN 
sNN 
=>NN 
sNN 
[NN 
randomNN %
.NN% &
NextNN& *
(NN* +
sNN+ ,
.NN, -
LengthNN- 3
)NN3 4
]NN4 5
)NN5 6
.NN6 7
ToArrayNN7 >
(NN> ?
)NN? @
)NN@ A
;NNA B
}OO 	
}PP 
}QQ é
GD:\temp\UrlShortener\UrlShortener.Application\Utils\AutoMapperConfig.cs
	namespace 	
UrlShortener
 
. 
Application "
." #
Utils# (
{ 
public 

class 
AutoMapperConfig !
:" #
Profile$ +
{ 
public		 
AutoMapperConfig		 
(		  
)		  !
{

 	
	CreateMap 
< 
Url 
, 
UrlModel #
># $
($ %
)% &
;& '
} 	
} 
} 