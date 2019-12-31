
_grep:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
}

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
   5:	53                   	push   %ebx
   6:	83 e4 f0             	and    $0xfffffff0,%esp
   9:	83 ec 20             	sub    $0x20,%esp
  int fd, i;
  char *pattern;

  if(argc <= 1){
   c:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
{
  10:	8b 55 0c             	mov    0xc(%ebp),%edx
  if(argc <= 1){
  13:	0f 8e 9e 00 00 00    	jle    b7 <main+0xb7>
    printf(2, "usage: grep pattern [file ...]\n");
    exit(0);
  }
  pattern = argv[1];

  if(argc <= 2){
  19:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
  pattern = argv[1];
  1d:	8b 7a 04             	mov    0x4(%edx),%edi
  if(argc <= 2){
  20:	74 53                	je     75 <main+0x75>
  22:	8d 72 08             	lea    0x8(%edx),%esi
    grep(pattern, 0);
    exit(0);
  }

  for(i = 2; i < argc; i++){
  25:	bb 02 00 00 00       	mov    $0x2,%ebx
  2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if((fd = open(argv[i], 0)) < 0){
  30:	31 c0                	xor    %eax,%eax
  32:	89 44 24 04          	mov    %eax,0x4(%esp)
  36:	8b 06                	mov    (%esi),%eax
  38:	89 04 24             	mov    %eax,(%esp)
  3b:	e8 78 05 00 00       	call   5b8 <open>
  40:	85 c0                	test   %eax,%eax
  42:	78 4d                	js     91 <main+0x91>
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit(0);
    }
    grep(pattern, fd);
  44:	89 44 24 04          	mov    %eax,0x4(%esp)
  for(i = 2; i < argc; i++){
  48:	43                   	inc    %ebx
  49:	83 c6 04             	add    $0x4,%esi
    grep(pattern, fd);
  4c:	89 3c 24             	mov    %edi,(%esp)
  4f:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  53:	e8 f8 01 00 00       	call   250 <grep>
    close(fd);
  58:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  5c:	89 04 24             	mov    %eax,(%esp)
  5f:	e8 3c 05 00 00       	call   5a0 <close>
  for(i = 2; i < argc; i++){
  64:	39 5d 08             	cmp    %ebx,0x8(%ebp)
  67:	7f c7                	jg     30 <main+0x30>
  }
  exit(0);
  69:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  70:	e8 03 05 00 00       	call   578 <exit>
    grep(pattern, 0);
  75:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  7c:	00 
  7d:	89 3c 24             	mov    %edi,(%esp)
  80:	e8 cb 01 00 00       	call   250 <grep>
    exit(0);
  85:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  8c:	e8 e7 04 00 00       	call   578 <exit>
      printf(1, "grep: cannot open %s\n", argv[i]);
  91:	8b 06                	mov    (%esi),%eax
  93:	c7 44 24 04 58 0a 00 	movl   $0xa58,0x4(%esp)
  9a:	00 
  9b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  a2:	89 44 24 08          	mov    %eax,0x8(%esp)
  a6:	e8 15 06 00 00       	call   6c0 <printf>
      exit(0);
  ab:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  b2:	e8 c1 04 00 00       	call   578 <exit>
    printf(2, "usage: grep pattern [file ...]\n");
  b7:	c7 44 24 04 38 0a 00 	movl   $0xa38,0x4(%esp)
  be:	00 
  bf:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  c6:	e8 f5 05 00 00       	call   6c0 <printf>
    exit(0);
  cb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  d2:	e8 a1 04 00 00       	call   578 <exit>
  d7:	66 90                	xchg   %ax,%ax
  d9:	66 90                	xchg   %ax,%ax
  db:	66 90                	xchg   %ax,%ax
  dd:	66 90                	xchg   %ax,%ax
  df:	90                   	nop

000000e0 <matchstar>:
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	57                   	push   %edi
  e4:	56                   	push   %esi
  e5:	53                   	push   %ebx
  e6:	83 ec 1c             	sub    $0x1c,%esp
  e9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  ec:	8b 75 0c             	mov    0xc(%ebp),%esi
  ef:	8b 7d 10             	mov    0x10(%ebp),%edi
  f2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
 100:	89 7c 24 04          	mov    %edi,0x4(%esp)
 104:	89 34 24             	mov    %esi,(%esp)
 107:	e8 34 00 00 00       	call   140 <matchhere>
 10c:	85 c0                	test   %eax,%eax
 10e:	75 20                	jne    130 <matchstar+0x50>
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
 110:	0f be 17             	movsbl (%edi),%edx
 113:	84 d2                	test   %dl,%dl
 115:	74 0a                	je     121 <matchstar+0x41>
 117:	47                   	inc    %edi
 118:	39 da                	cmp    %ebx,%edx
 11a:	74 e4                	je     100 <matchstar+0x20>
 11c:	83 fb 2e             	cmp    $0x2e,%ebx
 11f:	74 df                	je     100 <matchstar+0x20>
  return 0;
}
 121:	83 c4 1c             	add    $0x1c,%esp
 124:	5b                   	pop    %ebx
 125:	5e                   	pop    %esi
 126:	5f                   	pop    %edi
 127:	5d                   	pop    %ebp
 128:	c3                   	ret    
 129:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 130:	83 c4 1c             	add    $0x1c,%esp
      return 1;
 133:	b8 01 00 00 00       	mov    $0x1,%eax
}
 138:	5b                   	pop    %ebx
 139:	5e                   	pop    %esi
 13a:	5f                   	pop    %edi
 13b:	5d                   	pop    %ebp
 13c:	c3                   	ret    
 13d:	8d 76 00             	lea    0x0(%esi),%esi

00000140 <matchhere>:
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	57                   	push   %edi
 144:	56                   	push   %esi
 145:	53                   	push   %ebx
 146:	83 ec 1c             	sub    $0x1c,%esp
 149:	8b 55 08             	mov    0x8(%ebp),%edx
 14c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(re[0] == '\0')
 14f:	0f b6 0a             	movzbl (%edx),%ecx
 152:	84 c9                	test   %cl,%cl
 154:	74 61                	je     1b7 <matchhere+0x77>
  if(re[1] == '*')
 156:	0f be 42 01          	movsbl 0x1(%edx),%eax
 15a:	3c 2a                	cmp    $0x2a,%al
 15c:	74 66                	je     1c4 <matchhere+0x84>
  if(re[0] == '$' && re[1] == '\0')
 15e:	80 f9 24             	cmp    $0x24,%cl
 161:	0f b6 1f             	movzbl (%edi),%ebx
 164:	75 04                	jne    16a <matchhere+0x2a>
 166:	84 c0                	test   %al,%al
 168:	74 7e                	je     1e8 <matchhere+0xa8>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 16a:	84 db                	test   %bl,%bl
 16c:	74 09                	je     177 <matchhere+0x37>
 16e:	38 d9                	cmp    %bl,%cl
 170:	74 3d                	je     1af <matchhere+0x6f>
 172:	80 f9 2e             	cmp    $0x2e,%cl
 175:	74 38                	je     1af <matchhere+0x6f>
}
 177:	83 c4 1c             	add    $0x1c,%esp
  return 0;
 17a:	31 c0                	xor    %eax,%eax
}
 17c:	5b                   	pop    %ebx
 17d:	5e                   	pop    %esi
 17e:	5f                   	pop    %edi
 17f:	5d                   	pop    %ebp
 180:	c3                   	ret    
 181:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(re[1] == '*')
 188:	0f b6 4a 01          	movzbl 0x1(%edx),%ecx
 18c:	80 f9 2a             	cmp    $0x2a,%cl
 18f:	74 38                	je     1c9 <matchhere+0x89>
  if(re[0] == '$' && re[1] == '\0')
 191:	3c 24                	cmp    $0x24,%al
 193:	75 04                	jne    199 <matchhere+0x59>
 195:	84 c9                	test   %cl,%cl
 197:	74 4b                	je     1e4 <matchhere+0xa4>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 199:	0f b6 1e             	movzbl (%esi),%ebx
 19c:	84 db                	test   %bl,%bl
 19e:	66 90                	xchg   %ax,%ax
 1a0:	74 d5                	je     177 <matchhere+0x37>
 1a2:	3c 2e                	cmp    $0x2e,%al
 1a4:	89 f7                	mov    %esi,%edi
 1a6:	74 04                	je     1ac <matchhere+0x6c>
 1a8:	38 c3                	cmp    %al,%bl
 1aa:	75 cb                	jne    177 <matchhere+0x37>
 1ac:	0f be c1             	movsbl %cl,%eax
    return matchhere(re+1, text+1);
 1af:	42                   	inc    %edx
  if(re[0] == '\0')
 1b0:	84 c0                	test   %al,%al
    return matchhere(re+1, text+1);
 1b2:	8d 77 01             	lea    0x1(%edi),%esi
  if(re[0] == '\0')
 1b5:	75 d1                	jne    188 <matchhere+0x48>
    return 1;
 1b7:	b8 01 00 00 00       	mov    $0x1,%eax
}
 1bc:	83 c4 1c             	add    $0x1c,%esp
 1bf:	5b                   	pop    %ebx
 1c0:	5e                   	pop    %esi
 1c1:	5f                   	pop    %edi
 1c2:	5d                   	pop    %ebp
 1c3:	c3                   	ret    
  if(re[1] == '*')
 1c4:	89 fe                	mov    %edi,%esi
 1c6:	0f be c1             	movsbl %cl,%eax
    return matchstar(re[0], re+2, text);
 1c9:	83 c2 02             	add    $0x2,%edx
 1cc:	89 74 24 08          	mov    %esi,0x8(%esp)
 1d0:	89 54 24 04          	mov    %edx,0x4(%esp)
 1d4:	89 04 24             	mov    %eax,(%esp)
 1d7:	e8 04 ff ff ff       	call   e0 <matchstar>
}
 1dc:	83 c4 1c             	add    $0x1c,%esp
 1df:	5b                   	pop    %ebx
 1e0:	5e                   	pop    %esi
 1e1:	5f                   	pop    %edi
 1e2:	5d                   	pop    %ebp
 1e3:	c3                   	ret    
 1e4:	0f b6 5f 01          	movzbl 0x1(%edi),%ebx
    return *text == '\0';
 1e8:	31 c0                	xor    %eax,%eax
 1ea:	84 db                	test   %bl,%bl
 1ec:	0f 94 c0             	sete   %al
 1ef:	eb cb                	jmp    1bc <matchhere+0x7c>
 1f1:	eb 0d                	jmp    200 <match>
 1f3:	90                   	nop
 1f4:	90                   	nop
 1f5:	90                   	nop
 1f6:	90                   	nop
 1f7:	90                   	nop
 1f8:	90                   	nop
 1f9:	90                   	nop
 1fa:	90                   	nop
 1fb:	90                   	nop
 1fc:	90                   	nop
 1fd:	90                   	nop
 1fe:	90                   	nop
 1ff:	90                   	nop

00000200 <match>:
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	56                   	push   %esi
 204:	53                   	push   %ebx
 205:	83 ec 10             	sub    $0x10,%esp
 208:	8b 75 08             	mov    0x8(%ebp),%esi
 20b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(re[0] == '^')
 20e:	80 3e 5e             	cmpb   $0x5e,(%esi)
 211:	75 0c                	jne    21f <match+0x1f>
 213:	eb 2b                	jmp    240 <match+0x40>
 215:	8d 76 00             	lea    0x0(%esi),%esi
  }while(*text++ != '\0');
 218:	43                   	inc    %ebx
 219:	80 7b ff 00          	cmpb   $0x0,-0x1(%ebx)
 21d:	74 15                	je     234 <match+0x34>
    if(matchhere(re, text))
 21f:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 223:	89 34 24             	mov    %esi,(%esp)
 226:	e8 15 ff ff ff       	call   140 <matchhere>
 22b:	85 c0                	test   %eax,%eax
 22d:	74 e9                	je     218 <match+0x18>
      return 1;
 22f:	b8 01 00 00 00       	mov    $0x1,%eax
}
 234:	83 c4 10             	add    $0x10,%esp
 237:	5b                   	pop    %ebx
 238:	5e                   	pop    %esi
 239:	5d                   	pop    %ebp
 23a:	c3                   	ret    
 23b:	90                   	nop
 23c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return matchhere(re+1, text);
 240:	46                   	inc    %esi
 241:	89 75 08             	mov    %esi,0x8(%ebp)
}
 244:	83 c4 10             	add    $0x10,%esp
 247:	5b                   	pop    %ebx
 248:	5e                   	pop    %esi
 249:	5d                   	pop    %ebp
    return matchhere(re+1, text);
 24a:	e9 f1 fe ff ff       	jmp    140 <matchhere>
 24f:	90                   	nop

00000250 <grep>:
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	57                   	push   %edi
 254:	56                   	push   %esi
  m = 0;
 255:	31 f6                	xor    %esi,%esi
{
 257:	53                   	push   %ebx
 258:	83 ec 2c             	sub    $0x2c,%esp
 25b:	90                   	nop
 25c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
 260:	b8 ff 03 00 00       	mov    $0x3ff,%eax
 265:	29 f0                	sub    %esi,%eax
 267:	89 44 24 08          	mov    %eax,0x8(%esp)
 26b:	8d 86 20 0e 00 00    	lea    0xe20(%esi),%eax
 271:	89 44 24 04          	mov    %eax,0x4(%esp)
 275:	8b 45 0c             	mov    0xc(%ebp),%eax
 278:	89 04 24             	mov    %eax,(%esp)
 27b:	e8 10 03 00 00       	call   590 <read>
 280:	85 c0                	test   %eax,%eax
 282:	0f 8e b8 00 00 00    	jle    340 <grep+0xf0>
    m += n;
 288:	01 c6                	add    %eax,%esi
    p = buf;
 28a:	bf 20 0e 00 00       	mov    $0xe20,%edi
    buf[m] = '\0';
 28f:	c6 86 20 0e 00 00 00 	movb   $0x0,0xe20(%esi)
 296:	89 75 e0             	mov    %esi,-0x20(%ebp)
 299:	8b 75 08             	mov    0x8(%ebp),%esi
 29c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    while((q = strchr(p, '\n')) != 0){
 2a0:	b8 0a 00 00 00       	mov    $0xa,%eax
 2a5:	89 44 24 04          	mov    %eax,0x4(%esp)
 2a9:	89 3c 24             	mov    %edi,(%esp)
 2ac:	e8 4f 01 00 00       	call   400 <strchr>
 2b1:	85 c0                	test   %eax,%eax
 2b3:	89 c3                	mov    %eax,%ebx
 2b5:	74 49                	je     300 <grep+0xb0>
      *q = 0;
 2b7:	c6 03 00             	movb   $0x0,(%ebx)
      if(match(pattern, p)){
 2ba:	89 7c 24 04          	mov    %edi,0x4(%esp)
 2be:	89 34 24             	mov    %esi,(%esp)
 2c1:	e8 3a ff ff ff       	call   200 <match>
 2c6:	8d 4b 01             	lea    0x1(%ebx),%ecx
 2c9:	85 c0                	test   %eax,%eax
 2cb:	75 0b                	jne    2d8 <grep+0x88>
      p = q+1;
 2cd:	89 cf                	mov    %ecx,%edi
 2cf:	eb cf                	jmp    2a0 <grep+0x50>
 2d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        write(1, p, q+1 - p);
 2d8:	89 c8                	mov    %ecx,%eax
 2da:	29 f8                	sub    %edi,%eax
        *q = '\n';
 2dc:	c6 03 0a             	movb   $0xa,(%ebx)
        write(1, p, q+1 - p);
 2df:	89 7c 24 04          	mov    %edi,0x4(%esp)
 2e3:	89 44 24 08          	mov    %eax,0x8(%esp)
 2e7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2ee:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 2f1:	e8 a2 02 00 00       	call   598 <write>
 2f6:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
      p = q+1;
 2f9:	89 cf                	mov    %ecx,%edi
 2fb:	eb a3                	jmp    2a0 <grep+0x50>
 2fd:	8d 76 00             	lea    0x0(%esi),%esi
    if(p == buf)
 300:	81 ff 20 0e 00 00    	cmp    $0xe20,%edi
 306:	8b 75 e0             	mov    -0x20(%ebp),%esi
 309:	74 2d                	je     338 <grep+0xe8>
    if(m > 0){
 30b:	85 f6                	test   %esi,%esi
 30d:	0f 8e 4d ff ff ff    	jle    260 <grep+0x10>
      m -= p - buf;
 313:	89 f8                	mov    %edi,%eax
 315:	2d 20 0e 00 00       	sub    $0xe20,%eax
 31a:	29 c6                	sub    %eax,%esi
      memmove(buf, p, m);
 31c:	89 74 24 08          	mov    %esi,0x8(%esp)
 320:	89 7c 24 04          	mov    %edi,0x4(%esp)
 324:	c7 04 24 20 0e 00 00 	movl   $0xe20,(%esp)
 32b:	e8 10 02 00 00       	call   540 <memmove>
 330:	e9 2b ff ff ff       	jmp    260 <grep+0x10>
 335:	8d 76 00             	lea    0x0(%esi),%esi
      m = 0;
 338:	31 f6                	xor    %esi,%esi
 33a:	e9 21 ff ff ff       	jmp    260 <grep+0x10>
 33f:	90                   	nop
}
 340:	83 c4 2c             	add    $0x2c,%esp
 343:	5b                   	pop    %ebx
 344:	5e                   	pop    %esi
 345:	5f                   	pop    %edi
 346:	5d                   	pop    %ebp
 347:	c3                   	ret    
 348:	66 90                	xchg   %ax,%ax
 34a:	66 90                	xchg   %ax,%ax
 34c:	66 90                	xchg   %ax,%ax
 34e:	66 90                	xchg   %ax,%ax

00000350 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	8b 45 08             	mov    0x8(%ebp),%eax
 356:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 359:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 35a:	89 c2                	mov    %eax,%edx
 35c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 360:	41                   	inc    %ecx
 361:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 365:	42                   	inc    %edx
 366:	84 db                	test   %bl,%bl
 368:	88 5a ff             	mov    %bl,-0x1(%edx)
 36b:	75 f3                	jne    360 <strcpy+0x10>
    ;
  return os;
}
 36d:	5b                   	pop    %ebx
 36e:	5d                   	pop    %ebp
 36f:	c3                   	ret    

00000370 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	8b 4d 08             	mov    0x8(%ebp),%ecx
 376:	53                   	push   %ebx
 377:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while(*p && *p == *q)
 37a:	0f b6 01             	movzbl (%ecx),%eax
 37d:	0f b6 13             	movzbl (%ebx),%edx
 380:	84 c0                	test   %al,%al
 382:	75 18                	jne    39c <strcmp+0x2c>
 384:	eb 22                	jmp    3a8 <strcmp+0x38>
 386:	8d 76 00             	lea    0x0(%esi),%esi
 389:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 390:	41                   	inc    %ecx
  while(*p && *p == *q)
 391:	0f b6 01             	movzbl (%ecx),%eax
    p++, q++;
 394:	43                   	inc    %ebx
 395:	0f b6 13             	movzbl (%ebx),%edx
  while(*p && *p == *q)
 398:	84 c0                	test   %al,%al
 39a:	74 0c                	je     3a8 <strcmp+0x38>
 39c:	38 d0                	cmp    %dl,%al
 39e:	74 f0                	je     390 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
}
 3a0:	5b                   	pop    %ebx
  return (uchar)*p - (uchar)*q;
 3a1:	29 d0                	sub    %edx,%eax
}
 3a3:	5d                   	pop    %ebp
 3a4:	c3                   	ret    
 3a5:	8d 76 00             	lea    0x0(%esi),%esi
 3a8:	5b                   	pop    %ebx
 3a9:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 3ab:	29 d0                	sub    %edx,%eax
}
 3ad:	5d                   	pop    %ebp
 3ae:	c3                   	ret    
 3af:	90                   	nop

000003b0 <strlen>:

uint
strlen(const char *s)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3b6:	80 39 00             	cmpb   $0x0,(%ecx)
 3b9:	74 15                	je     3d0 <strlen+0x20>
 3bb:	31 d2                	xor    %edx,%edx
 3bd:	8d 76 00             	lea    0x0(%esi),%esi
 3c0:	42                   	inc    %edx
 3c1:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 3c5:	89 d0                	mov    %edx,%eax
 3c7:	75 f7                	jne    3c0 <strlen+0x10>
    ;
  return n;
}
 3c9:	5d                   	pop    %ebp
 3ca:	c3                   	ret    
 3cb:	90                   	nop
 3cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(n = 0; s[n]; n++)
 3d0:	31 c0                	xor    %eax,%eax
}
 3d2:	5d                   	pop    %ebp
 3d3:	c3                   	ret    
 3d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 3da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000003e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	8b 55 08             	mov    0x8(%ebp),%edx
 3e6:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 3e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ed:	89 d7                	mov    %edx,%edi
 3ef:	fc                   	cld    
 3f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 3f2:	5f                   	pop    %edi
 3f3:	89 d0                	mov    %edx,%eax
 3f5:	5d                   	pop    %ebp
 3f6:	c3                   	ret    
 3f7:	89 f6                	mov    %esi,%esi
 3f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000400 <strchr>:

char*
strchr(const char *s, char c)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	8b 45 08             	mov    0x8(%ebp),%eax
 406:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 40a:	0f b6 10             	movzbl (%eax),%edx
 40d:	84 d2                	test   %dl,%dl
 40f:	74 1b                	je     42c <strchr+0x2c>
    if(*s == c)
 411:	38 d1                	cmp    %dl,%cl
 413:	75 0f                	jne    424 <strchr+0x24>
 415:	eb 17                	jmp    42e <strchr+0x2e>
 417:	89 f6                	mov    %esi,%esi
 419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 420:	38 ca                	cmp    %cl,%dl
 422:	74 0a                	je     42e <strchr+0x2e>
  for(; *s; s++)
 424:	40                   	inc    %eax
 425:	0f b6 10             	movzbl (%eax),%edx
 428:	84 d2                	test   %dl,%dl
 42a:	75 f4                	jne    420 <strchr+0x20>
      return (char*)s;
  return 0;
 42c:	31 c0                	xor    %eax,%eax
}
 42e:	5d                   	pop    %ebp
 42f:	c3                   	ret    

00000430 <gets>:

char*
gets(char *buf, int max)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	57                   	push   %edi
 434:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 435:	31 f6                	xor    %esi,%esi
{
 437:	53                   	push   %ebx
 438:	83 ec 3c             	sub    $0x3c,%esp
 43b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    cc = read(0, &c, 1);
 43e:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 441:	eb 32                	jmp    475 <gets+0x45>
 443:	90                   	nop
 444:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cc = read(0, &c, 1);
 448:	ba 01 00 00 00       	mov    $0x1,%edx
 44d:	89 54 24 08          	mov    %edx,0x8(%esp)
 451:	89 7c 24 04          	mov    %edi,0x4(%esp)
 455:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 45c:	e8 2f 01 00 00       	call   590 <read>
    if(cc < 1)
 461:	85 c0                	test   %eax,%eax
 463:	7e 19                	jle    47e <gets+0x4e>
      break;
    buf[i++] = c;
 465:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 469:	43                   	inc    %ebx
 46a:	88 43 ff             	mov    %al,-0x1(%ebx)
    if(c == '\n' || c == '\r')
 46d:	3c 0a                	cmp    $0xa,%al
 46f:	74 1f                	je     490 <gets+0x60>
 471:	3c 0d                	cmp    $0xd,%al
 473:	74 1b                	je     490 <gets+0x60>
  for(i=0; i+1 < max; ){
 475:	46                   	inc    %esi
 476:	3b 75 0c             	cmp    0xc(%ebp),%esi
 479:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 47c:	7c ca                	jl     448 <gets+0x18>
      break;
  }
  buf[i] = '\0';
 47e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 481:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
}
 484:	8b 45 08             	mov    0x8(%ebp),%eax
 487:	83 c4 3c             	add    $0x3c,%esp
 48a:	5b                   	pop    %ebx
 48b:	5e                   	pop    %esi
 48c:	5f                   	pop    %edi
 48d:	5d                   	pop    %ebp
 48e:	c3                   	ret    
 48f:	90                   	nop
 490:	8b 45 08             	mov    0x8(%ebp),%eax
 493:	01 c6                	add    %eax,%esi
 495:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 498:	eb e4                	jmp    47e <gets+0x4e>
 49a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000004a0 <stat>:

int
stat(const char *n, struct stat *st)
{
 4a0:	55                   	push   %ebp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4a1:	31 c0                	xor    %eax,%eax
{
 4a3:	89 e5                	mov    %esp,%ebp
 4a5:	83 ec 18             	sub    $0x18,%esp
  fd = open(n, O_RDONLY);
 4a8:	89 44 24 04          	mov    %eax,0x4(%esp)
 4ac:	8b 45 08             	mov    0x8(%ebp),%eax
{
 4af:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 4b2:	89 75 fc             	mov    %esi,-0x4(%ebp)
  fd = open(n, O_RDONLY);
 4b5:	89 04 24             	mov    %eax,(%esp)
 4b8:	e8 fb 00 00 00       	call   5b8 <open>
  if(fd < 0)
 4bd:	85 c0                	test   %eax,%eax
 4bf:	78 2f                	js     4f0 <stat+0x50>
 4c1:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 4c3:	8b 45 0c             	mov    0xc(%ebp),%eax
 4c6:	89 1c 24             	mov    %ebx,(%esp)
 4c9:	89 44 24 04          	mov    %eax,0x4(%esp)
 4cd:	e8 fe 00 00 00       	call   5d0 <fstat>
  close(fd);
 4d2:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 4d5:	89 c6                	mov    %eax,%esi
  close(fd);
 4d7:	e8 c4 00 00 00       	call   5a0 <close>
  return r;
}
 4dc:	89 f0                	mov    %esi,%eax
 4de:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 4e1:	8b 75 fc             	mov    -0x4(%ebp),%esi
 4e4:	89 ec                	mov    %ebp,%esp
 4e6:	5d                   	pop    %ebp
 4e7:	c3                   	ret    
 4e8:	90                   	nop
 4e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 4f0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 4f5:	eb e5                	jmp    4dc <stat+0x3c>
 4f7:	89 f6                	mov    %esi,%esi
 4f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000500 <atoi>:

int
atoi(const char *s)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	8b 4d 08             	mov    0x8(%ebp),%ecx
 506:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 507:	0f be 11             	movsbl (%ecx),%edx
 50a:	88 d0                	mov    %dl,%al
 50c:	2c 30                	sub    $0x30,%al
 50e:	3c 09                	cmp    $0x9,%al
  n = 0;
 510:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 515:	77 1e                	ja     535 <atoi+0x35>
 517:	89 f6                	mov    %esi,%esi
 519:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 520:	41                   	inc    %ecx
 521:	8d 04 80             	lea    (%eax,%eax,4),%eax
 524:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 528:	0f be 11             	movsbl (%ecx),%edx
 52b:	88 d3                	mov    %dl,%bl
 52d:	80 eb 30             	sub    $0x30,%bl
 530:	80 fb 09             	cmp    $0x9,%bl
 533:	76 eb                	jbe    520 <atoi+0x20>
  return n;
}
 535:	5b                   	pop    %ebx
 536:	5d                   	pop    %ebp
 537:	c3                   	ret    
 538:	90                   	nop
 539:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000540 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 540:	55                   	push   %ebp
 541:	89 e5                	mov    %esp,%ebp
 543:	56                   	push   %esi
 544:	8b 45 08             	mov    0x8(%ebp),%eax
 547:	53                   	push   %ebx
 548:	8b 5d 10             	mov    0x10(%ebp),%ebx
 54b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 54e:	85 db                	test   %ebx,%ebx
 550:	7e 1a                	jle    56c <memmove+0x2c>
 552:	31 d2                	xor    %edx,%edx
 554:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 55a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi
    *dst++ = *src++;
 560:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 564:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 567:	42                   	inc    %edx
  while(n-- > 0)
 568:	39 d3                	cmp    %edx,%ebx
 56a:	75 f4                	jne    560 <memmove+0x20>
  return vdst;
}
 56c:	5b                   	pop    %ebx
 56d:	5e                   	pop    %esi
 56e:	5d                   	pop    %ebp
 56f:	c3                   	ret    

00000570 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 570:	b8 01 00 00 00       	mov    $0x1,%eax
 575:	cd 40                	int    $0x40
 577:	c3                   	ret    

00000578 <exit>:
SYSCALL(exit)
 578:	b8 02 00 00 00       	mov    $0x2,%eax
 57d:	cd 40                	int    $0x40
 57f:	c3                   	ret    

00000580 <wait>:
SYSCALL(wait)
 580:	b8 03 00 00 00       	mov    $0x3,%eax
 585:	cd 40                	int    $0x40
 587:	c3                   	ret    

00000588 <pipe>:
SYSCALL(pipe)
 588:	b8 04 00 00 00       	mov    $0x4,%eax
 58d:	cd 40                	int    $0x40
 58f:	c3                   	ret    

00000590 <read>:
SYSCALL(read)
 590:	b8 05 00 00 00       	mov    $0x5,%eax
 595:	cd 40                	int    $0x40
 597:	c3                   	ret    

00000598 <write>:
SYSCALL(write)
 598:	b8 10 00 00 00       	mov    $0x10,%eax
 59d:	cd 40                	int    $0x40
 59f:	c3                   	ret    

000005a0 <close>:
SYSCALL(close)
 5a0:	b8 15 00 00 00       	mov    $0x15,%eax
 5a5:	cd 40                	int    $0x40
 5a7:	c3                   	ret    

000005a8 <kill>:
SYSCALL(kill)
 5a8:	b8 06 00 00 00       	mov    $0x6,%eax
 5ad:	cd 40                	int    $0x40
 5af:	c3                   	ret    

000005b0 <exec>:
SYSCALL(exec)
 5b0:	b8 07 00 00 00       	mov    $0x7,%eax
 5b5:	cd 40                	int    $0x40
 5b7:	c3                   	ret    

000005b8 <open>:
SYSCALL(open)
 5b8:	b8 0f 00 00 00       	mov    $0xf,%eax
 5bd:	cd 40                	int    $0x40
 5bf:	c3                   	ret    

000005c0 <mknod>:
SYSCALL(mknod)
 5c0:	b8 11 00 00 00       	mov    $0x11,%eax
 5c5:	cd 40                	int    $0x40
 5c7:	c3                   	ret    

000005c8 <unlink>:
SYSCALL(unlink)
 5c8:	b8 12 00 00 00       	mov    $0x12,%eax
 5cd:	cd 40                	int    $0x40
 5cf:	c3                   	ret    

000005d0 <fstat>:
SYSCALL(fstat)
 5d0:	b8 08 00 00 00       	mov    $0x8,%eax
 5d5:	cd 40                	int    $0x40
 5d7:	c3                   	ret    

000005d8 <link>:
SYSCALL(link)
 5d8:	b8 13 00 00 00       	mov    $0x13,%eax
 5dd:	cd 40                	int    $0x40
 5df:	c3                   	ret    

000005e0 <mkdir>:
SYSCALL(mkdir)
 5e0:	b8 14 00 00 00       	mov    $0x14,%eax
 5e5:	cd 40                	int    $0x40
 5e7:	c3                   	ret    

000005e8 <chdir>:
SYSCALL(chdir)
 5e8:	b8 09 00 00 00       	mov    $0x9,%eax
 5ed:	cd 40                	int    $0x40
 5ef:	c3                   	ret    

000005f0 <dup>:
SYSCALL(dup)
 5f0:	b8 0a 00 00 00       	mov    $0xa,%eax
 5f5:	cd 40                	int    $0x40
 5f7:	c3                   	ret    

000005f8 <getpid>:
SYSCALL(getpid)
 5f8:	b8 0b 00 00 00       	mov    $0xb,%eax
 5fd:	cd 40                	int    $0x40
 5ff:	c3                   	ret    

00000600 <sbrk>:
SYSCALL(sbrk)
 600:	b8 0c 00 00 00       	mov    $0xc,%eax
 605:	cd 40                	int    $0x40
 607:	c3                   	ret    

00000608 <sleep>:
SYSCALL(sleep)
 608:	b8 0d 00 00 00       	mov    $0xd,%eax
 60d:	cd 40                	int    $0x40
 60f:	c3                   	ret    

00000610 <uptime>:
SYSCALL(uptime)
 610:	b8 0e 00 00 00       	mov    $0xe,%eax
 615:	cd 40                	int    $0x40
 617:	c3                   	ret    

00000618 <detach>:
SYSCALL(detach)
 618:	b8 16 00 00 00       	mov    $0x16,%eax
 61d:	cd 40                	int    $0x40
 61f:	c3                   	ret    

00000620 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 620:	55                   	push   %ebp
 621:	89 e5                	mov    %esp,%ebp
 623:	57                   	push   %edi
 624:	56                   	push   %esi
 625:	53                   	push   %ebx
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 626:	89 d3                	mov    %edx,%ebx
 628:	c1 eb 1f             	shr    $0x1f,%ebx
{
 62b:	83 ec 4c             	sub    $0x4c,%esp
  if(sgn && xx < 0){
 62e:	84 db                	test   %bl,%bl
{
 630:	89 45 c0             	mov    %eax,-0x40(%ebp)
 633:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 635:	74 79                	je     6b0 <printint+0x90>
 637:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 63b:	74 73                	je     6b0 <printint+0x90>
    neg = 1;
    x = -xx;
 63d:	f7 d8                	neg    %eax
    neg = 1;
 63f:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 646:	31 f6                	xor    %esi,%esi
 648:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 64b:	eb 05                	jmp    652 <printint+0x32>
 64d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 650:	89 fe                	mov    %edi,%esi
 652:	31 d2                	xor    %edx,%edx
 654:	f7 f1                	div    %ecx
 656:	8d 7e 01             	lea    0x1(%esi),%edi
 659:	0f b6 92 78 0a 00 00 	movzbl 0xa78(%edx),%edx
  }while((x /= base) != 0);
 660:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 662:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 665:	75 e9                	jne    650 <printint+0x30>
  if(neg)
 667:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 66a:	85 d2                	test   %edx,%edx
 66c:	74 08                	je     676 <printint+0x56>
    buf[i++] = '-';
 66e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 673:	8d 7e 02             	lea    0x2(%esi),%edi
 676:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 67a:	8b 7d c0             	mov    -0x40(%ebp),%edi
 67d:	8d 76 00             	lea    0x0(%esi),%esi
 680:	0f b6 06             	movzbl (%esi),%eax
 683:	4e                   	dec    %esi
  write(fd, &c, 1);
 684:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 688:	89 3c 24             	mov    %edi,(%esp)
 68b:	88 45 d7             	mov    %al,-0x29(%ebp)
 68e:	b8 01 00 00 00       	mov    $0x1,%eax
 693:	89 44 24 08          	mov    %eax,0x8(%esp)
 697:	e8 fc fe ff ff       	call   598 <write>

  while(--i >= 0)
 69c:	39 de                	cmp    %ebx,%esi
 69e:	75 e0                	jne    680 <printint+0x60>
    putc(fd, buf[i]);
}
 6a0:	83 c4 4c             	add    $0x4c,%esp
 6a3:	5b                   	pop    %ebx
 6a4:	5e                   	pop    %esi
 6a5:	5f                   	pop    %edi
 6a6:	5d                   	pop    %ebp
 6a7:	c3                   	ret    
 6a8:	90                   	nop
 6a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 6b0:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 6b7:	eb 8d                	jmp    646 <printint+0x26>
 6b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000006c0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 6c0:	55                   	push   %ebp
 6c1:	89 e5                	mov    %esp,%ebp
 6c3:	57                   	push   %edi
 6c4:	56                   	push   %esi
 6c5:	53                   	push   %ebx
 6c6:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6c9:	8b 75 0c             	mov    0xc(%ebp),%esi
 6cc:	0f b6 1e             	movzbl (%esi),%ebx
 6cf:	84 db                	test   %bl,%bl
 6d1:	0f 84 d1 00 00 00    	je     7a8 <printf+0xe8>
  state = 0;
 6d7:	31 ff                	xor    %edi,%edi
 6d9:	46                   	inc    %esi
  ap = (uint*)(void*)&fmt + 1;
 6da:	8d 45 10             	lea    0x10(%ebp),%eax
  write(fd, &c, 1);
 6dd:	89 fa                	mov    %edi,%edx
 6df:	8b 7d 08             	mov    0x8(%ebp),%edi
  ap = (uint*)(void*)&fmt + 1;
 6e2:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6e5:	eb 41                	jmp    728 <printf+0x68>
 6e7:	89 f6                	mov    %esi,%esi
 6e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 6f0:	83 f8 25             	cmp    $0x25,%eax
 6f3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 6f6:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 6fb:	74 1e                	je     71b <printf+0x5b>
  write(fd, &c, 1);
 6fd:	b8 01 00 00 00       	mov    $0x1,%eax
 702:	89 44 24 08          	mov    %eax,0x8(%esp)
 706:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 709:	89 44 24 04          	mov    %eax,0x4(%esp)
 70d:	89 3c 24             	mov    %edi,(%esp)
 710:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 713:	e8 80 fe ff ff       	call   598 <write>
 718:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 71b:	46                   	inc    %esi
  for(i = 0; fmt[i]; i++){
 71c:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 720:	84 db                	test   %bl,%bl
 722:	0f 84 80 00 00 00    	je     7a8 <printf+0xe8>
    if(state == 0){
 728:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
 72a:	0f be cb             	movsbl %bl,%ecx
 72d:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 730:	74 be                	je     6f0 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 732:	83 fa 25             	cmp    $0x25,%edx
 735:	75 e4                	jne    71b <printf+0x5b>
      if(c == 'd'){
 737:	83 f8 64             	cmp    $0x64,%eax
 73a:	0f 84 f0 00 00 00    	je     830 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 740:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 746:	83 f9 70             	cmp    $0x70,%ecx
 749:	74 65                	je     7b0 <printf+0xf0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 74b:	83 f8 73             	cmp    $0x73,%eax
 74e:	0f 84 8c 00 00 00    	je     7e0 <printf+0x120>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 754:	83 f8 63             	cmp    $0x63,%eax
 757:	0f 84 13 01 00 00    	je     870 <printf+0x1b0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 75d:	83 f8 25             	cmp    $0x25,%eax
 760:	0f 84 e2 00 00 00    	je     848 <printf+0x188>
  write(fd, &c, 1);
 766:	b8 01 00 00 00       	mov    $0x1,%eax
 76b:	46                   	inc    %esi
 76c:	89 44 24 08          	mov    %eax,0x8(%esp)
 770:	8d 45 e7             	lea    -0x19(%ebp),%eax
 773:	89 44 24 04          	mov    %eax,0x4(%esp)
 777:	89 3c 24             	mov    %edi,(%esp)
 77a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 77e:	e8 15 fe ff ff       	call   598 <write>
 783:	ba 01 00 00 00       	mov    $0x1,%edx
 788:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 78b:	89 54 24 08          	mov    %edx,0x8(%esp)
 78f:	89 44 24 04          	mov    %eax,0x4(%esp)
 793:	89 3c 24             	mov    %edi,(%esp)
 796:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 799:	e8 fa fd ff ff       	call   598 <write>
  for(i = 0; fmt[i]; i++){
 79e:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7a2:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 7a4:	84 db                	test   %bl,%bl
 7a6:	75 80                	jne    728 <printf+0x68>
    }
  }
}
 7a8:	83 c4 3c             	add    $0x3c,%esp
 7ab:	5b                   	pop    %ebx
 7ac:	5e                   	pop    %esi
 7ad:	5f                   	pop    %edi
 7ae:	5d                   	pop    %ebp
 7af:	c3                   	ret    
        printint(fd, *ap, 16, 0);
 7b0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 7b7:	b9 10 00 00 00       	mov    $0x10,%ecx
 7bc:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 7bf:	89 f8                	mov    %edi,%eax
 7c1:	8b 13                	mov    (%ebx),%edx
 7c3:	e8 58 fe ff ff       	call   620 <printint>
        ap++;
 7c8:	89 d8                	mov    %ebx,%eax
      state = 0;
 7ca:	31 d2                	xor    %edx,%edx
        ap++;
 7cc:	83 c0 04             	add    $0x4,%eax
 7cf:	89 45 d0             	mov    %eax,-0x30(%ebp)
 7d2:	e9 44 ff ff ff       	jmp    71b <printf+0x5b>
 7d7:	89 f6                	mov    %esi,%esi
 7d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
 7e0:	8b 45 d0             	mov    -0x30(%ebp),%eax
 7e3:	8b 10                	mov    (%eax),%edx
        ap++;
 7e5:	83 c0 04             	add    $0x4,%eax
 7e8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 7eb:	85 d2                	test   %edx,%edx
 7ed:	0f 84 aa 00 00 00    	je     89d <printf+0x1dd>
        while(*s != 0){
 7f3:	0f b6 02             	movzbl (%edx),%eax
        s = (char*)*ap;
 7f6:	89 d3                	mov    %edx,%ebx
        while(*s != 0){
 7f8:	84 c0                	test   %al,%al
 7fa:	74 27                	je     823 <printf+0x163>
 7fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 800:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 803:	b8 01 00 00 00       	mov    $0x1,%eax
          s++;
 808:	43                   	inc    %ebx
  write(fd, &c, 1);
 809:	89 44 24 08          	mov    %eax,0x8(%esp)
 80d:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 810:	89 44 24 04          	mov    %eax,0x4(%esp)
 814:	89 3c 24             	mov    %edi,(%esp)
 817:	e8 7c fd ff ff       	call   598 <write>
        while(*s != 0){
 81c:	0f b6 03             	movzbl (%ebx),%eax
 81f:	84 c0                	test   %al,%al
 821:	75 dd                	jne    800 <printf+0x140>
      state = 0;
 823:	31 d2                	xor    %edx,%edx
 825:	e9 f1 fe ff ff       	jmp    71b <printf+0x5b>
 82a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 830:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 837:	b9 0a 00 00 00       	mov    $0xa,%ecx
 83c:	e9 7b ff ff ff       	jmp    7bc <printf+0xfc>
 841:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 848:	b9 01 00 00 00       	mov    $0x1,%ecx
 84d:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 850:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 854:	89 44 24 04          	mov    %eax,0x4(%esp)
 858:	89 3c 24             	mov    %edi,(%esp)
 85b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 85e:	e8 35 fd ff ff       	call   598 <write>
      state = 0;
 863:	31 d2                	xor    %edx,%edx
 865:	e9 b1 fe ff ff       	jmp    71b <printf+0x5b>
 86a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, *ap);
 870:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 873:	8b 03                	mov    (%ebx),%eax
        ap++;
 875:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 878:	89 3c 24             	mov    %edi,(%esp)
        putc(fd, *ap);
 87b:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 87e:	b8 01 00 00 00       	mov    $0x1,%eax
 883:	89 44 24 08          	mov    %eax,0x8(%esp)
 887:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 88a:	89 44 24 04          	mov    %eax,0x4(%esp)
 88e:	e8 05 fd ff ff       	call   598 <write>
      state = 0;
 893:	31 d2                	xor    %edx,%edx
        ap++;
 895:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 898:	e9 7e fe ff ff       	jmp    71b <printf+0x5b>
          s = "(null)";
 89d:	bb 6e 0a 00 00       	mov    $0xa6e,%ebx
        while(*s != 0){
 8a2:	b0 28                	mov    $0x28,%al
 8a4:	e9 57 ff ff ff       	jmp    800 <printf+0x140>
 8a9:	66 90                	xchg   %ax,%ax
 8ab:	66 90                	xchg   %ax,%ax
 8ad:	66 90                	xchg   %ax,%ax
 8af:	90                   	nop

000008b0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8b0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8b1:	a1 00 0e 00 00       	mov    0xe00,%eax
{
 8b6:	89 e5                	mov    %esp,%ebp
 8b8:	57                   	push   %edi
 8b9:	56                   	push   %esi
 8ba:	53                   	push   %ebx
 8bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 8be:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 8c1:	eb 0d                	jmp    8d0 <free+0x20>
 8c3:	90                   	nop
 8c4:	90                   	nop
 8c5:	90                   	nop
 8c6:	90                   	nop
 8c7:	90                   	nop
 8c8:	90                   	nop
 8c9:	90                   	nop
 8ca:	90                   	nop
 8cb:	90                   	nop
 8cc:	90                   	nop
 8cd:	90                   	nop
 8ce:	90                   	nop
 8cf:	90                   	nop
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8d0:	39 c8                	cmp    %ecx,%eax
 8d2:	8b 10                	mov    (%eax),%edx
 8d4:	73 32                	jae    908 <free+0x58>
 8d6:	39 d1                	cmp    %edx,%ecx
 8d8:	72 04                	jb     8de <free+0x2e>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8da:	39 d0                	cmp    %edx,%eax
 8dc:	72 32                	jb     910 <free+0x60>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8de:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8e1:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8e4:	39 fa                	cmp    %edi,%edx
 8e6:	74 30                	je     918 <free+0x68>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 8e8:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 8eb:	8b 50 04             	mov    0x4(%eax),%edx
 8ee:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 8f1:	39 f1                	cmp    %esi,%ecx
 8f3:	74 3c                	je     931 <free+0x81>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 8f5:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 8f7:	5b                   	pop    %ebx
  freep = p;
 8f8:	a3 00 0e 00 00       	mov    %eax,0xe00
}
 8fd:	5e                   	pop    %esi
 8fe:	5f                   	pop    %edi
 8ff:	5d                   	pop    %ebp
 900:	c3                   	ret    
 901:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 908:	39 d0                	cmp    %edx,%eax
 90a:	72 04                	jb     910 <free+0x60>
 90c:	39 d1                	cmp    %edx,%ecx
 90e:	72 ce                	jb     8de <free+0x2e>
{
 910:	89 d0                	mov    %edx,%eax
 912:	eb bc                	jmp    8d0 <free+0x20>
 914:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 918:	8b 7a 04             	mov    0x4(%edx),%edi
 91b:	01 fe                	add    %edi,%esi
 91d:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 920:	8b 10                	mov    (%eax),%edx
 922:	8b 12                	mov    (%edx),%edx
 924:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 927:	8b 50 04             	mov    0x4(%eax),%edx
 92a:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 92d:	39 f1                	cmp    %esi,%ecx
 92f:	75 c4                	jne    8f5 <free+0x45>
    p->s.size += bp->s.size;
 931:	8b 4b fc             	mov    -0x4(%ebx),%ecx
  freep = p;
 934:	a3 00 0e 00 00       	mov    %eax,0xe00
    p->s.size += bp->s.size;
 939:	01 ca                	add    %ecx,%edx
 93b:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 93e:	8b 53 f8             	mov    -0x8(%ebx),%edx
 941:	89 10                	mov    %edx,(%eax)
}
 943:	5b                   	pop    %ebx
 944:	5e                   	pop    %esi
 945:	5f                   	pop    %edi
 946:	5d                   	pop    %ebp
 947:	c3                   	ret    
 948:	90                   	nop
 949:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000950 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 950:	55                   	push   %ebp
 951:	89 e5                	mov    %esp,%ebp
 953:	57                   	push   %edi
 954:	56                   	push   %esi
 955:	53                   	push   %ebx
 956:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 959:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 95c:	8b 15 00 0e 00 00    	mov    0xe00,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 962:	8d 78 07             	lea    0x7(%eax),%edi
 965:	c1 ef 03             	shr    $0x3,%edi
 968:	47                   	inc    %edi
  if((prevp = freep) == 0){
 969:	85 d2                	test   %edx,%edx
 96b:	0f 84 8f 00 00 00    	je     a00 <malloc+0xb0>
 971:	8b 02                	mov    (%edx),%eax
 973:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 976:	39 cf                	cmp    %ecx,%edi
 978:	76 66                	jbe    9e0 <malloc+0x90>
 97a:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 980:	bb 00 10 00 00       	mov    $0x1000,%ebx
 985:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 988:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 98f:	eb 10                	jmp    9a1 <malloc+0x51>
 991:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 998:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 99a:	8b 48 04             	mov    0x4(%eax),%ecx
 99d:	39 f9                	cmp    %edi,%ecx
 99f:	73 3f                	jae    9e0 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 9a1:	39 05 00 0e 00 00    	cmp    %eax,0xe00
 9a7:	89 c2                	mov    %eax,%edx
 9a9:	75 ed                	jne    998 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 9ab:	89 34 24             	mov    %esi,(%esp)
 9ae:	e8 4d fc ff ff       	call   600 <sbrk>
  if(p == (char*)-1)
 9b3:	83 f8 ff             	cmp    $0xffffffff,%eax
 9b6:	74 18                	je     9d0 <malloc+0x80>
  hp->s.size = nu;
 9b8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9bb:	83 c0 08             	add    $0x8,%eax
 9be:	89 04 24             	mov    %eax,(%esp)
 9c1:	e8 ea fe ff ff       	call   8b0 <free>
  return freep;
 9c6:	8b 15 00 0e 00 00    	mov    0xe00,%edx
      if((p = morecore(nunits)) == 0)
 9cc:	85 d2                	test   %edx,%edx
 9ce:	75 c8                	jne    998 <malloc+0x48>
        return 0;
  }
}
 9d0:	83 c4 1c             	add    $0x1c,%esp
        return 0;
 9d3:	31 c0                	xor    %eax,%eax
}
 9d5:	5b                   	pop    %ebx
 9d6:	5e                   	pop    %esi
 9d7:	5f                   	pop    %edi
 9d8:	5d                   	pop    %ebp
 9d9:	c3                   	ret    
 9da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 9e0:	39 cf                	cmp    %ecx,%edi
 9e2:	74 4c                	je     a30 <malloc+0xe0>
        p->s.size -= nunits;
 9e4:	29 f9                	sub    %edi,%ecx
 9e6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 9e9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 9ec:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 9ef:	89 15 00 0e 00 00    	mov    %edx,0xe00
}
 9f5:	83 c4 1c             	add    $0x1c,%esp
      return (void*)(p + 1);
 9f8:	83 c0 08             	add    $0x8,%eax
}
 9fb:	5b                   	pop    %ebx
 9fc:	5e                   	pop    %esi
 9fd:	5f                   	pop    %edi
 9fe:	5d                   	pop    %ebp
 9ff:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 a00:	b8 04 0e 00 00       	mov    $0xe04,%eax
 a05:	ba 04 0e 00 00       	mov    $0xe04,%edx
    base.s.size = 0;
 a0a:	31 c9                	xor    %ecx,%ecx
    base.s.ptr = freep = prevp = &base;
 a0c:	a3 00 0e 00 00       	mov    %eax,0xe00
    base.s.size = 0;
 a11:	b8 04 0e 00 00       	mov    $0xe04,%eax
    base.s.ptr = freep = prevp = &base;
 a16:	89 15 04 0e 00 00    	mov    %edx,0xe04
    base.s.size = 0;
 a1c:	89 0d 08 0e 00 00    	mov    %ecx,0xe08
 a22:	e9 53 ff ff ff       	jmp    97a <malloc+0x2a>
 a27:	89 f6                	mov    %esi,%esi
 a29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        prevp->s.ptr = p->s.ptr;
 a30:	8b 08                	mov    (%eax),%ecx
 a32:	89 0a                	mov    %ecx,(%edx)
 a34:	eb b9                	jmp    9ef <malloc+0x9f>
