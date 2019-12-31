
_kill:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	56                   	push   %esi
   4:	53                   	push   %ebx
   5:	83 e4 f0             	and    $0xfffffff0,%esp
   8:	83 ec 10             	sub    $0x10,%esp
   b:	8b 45 08             	mov    0x8(%ebp),%eax
   e:	8b 55 0c             	mov    0xc(%ebp),%edx
  int i;

  if(argc < 2){
  11:	83 f8 01             	cmp    $0x1,%eax
  14:	7e 2f                	jle    45 <main+0x45>
  16:	8d 5a 04             	lea    0x4(%edx),%ebx
  19:	8d 34 82             	lea    (%edx,%eax,4),%esi
  1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(2, "usage: kill pid...\n");
    exit(0);
  }
  for(i=1; i<argc; i++)
    kill(atoi(argv[i]));
  20:	8b 03                	mov    (%ebx),%eax
  22:	83 c3 04             	add    $0x4,%ebx
  25:	89 04 24             	mov    %eax,(%esp)
  28:	e8 f3 01 00 00       	call   220 <atoi>
  2d:	89 04 24             	mov    %eax,(%esp)
  30:	e8 93 02 00 00       	call   2c8 <kill>
  for(i=1; i<argc; i++)
  35:	39 f3                	cmp    %esi,%ebx
  37:	75 e7                	jne    20 <main+0x20>
  exit(0);
  39:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  40:	e8 53 02 00 00       	call   298 <exit>
    printf(2, "usage: kill pid...\n");
  45:	c7 44 24 04 58 07 00 	movl   $0x758,0x4(%esp)
  4c:	00 
  4d:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  54:	e8 87 03 00 00       	call   3e0 <printf>
    exit(0);
  59:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  60:	e8 33 02 00 00       	call   298 <exit>
  65:	66 90                	xchg   %ax,%ax
  67:	66 90                	xchg   %ax,%ax
  69:	66 90                	xchg   %ax,%ax
  6b:	66 90                	xchg   %ax,%ax
  6d:	66 90                	xchg   %ax,%ax
  6f:	90                   	nop

00000070 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  70:	55                   	push   %ebp
  71:	89 e5                	mov    %esp,%ebp
  73:	8b 45 08             	mov    0x8(%ebp),%eax
  76:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  79:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  7a:	89 c2                	mov    %eax,%edx
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  80:	41                   	inc    %ecx
  81:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  85:	42                   	inc    %edx
  86:	84 db                	test   %bl,%bl
  88:	88 5a ff             	mov    %bl,-0x1(%edx)
  8b:	75 f3                	jne    80 <strcpy+0x10>
    ;
  return os;
}
  8d:	5b                   	pop    %ebx
  8e:	5d                   	pop    %ebp
  8f:	c3                   	ret    

00000090 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	8b 4d 08             	mov    0x8(%ebp),%ecx
  96:	53                   	push   %ebx
  97:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while(*p && *p == *q)
  9a:	0f b6 01             	movzbl (%ecx),%eax
  9d:	0f b6 13             	movzbl (%ebx),%edx
  a0:	84 c0                	test   %al,%al
  a2:	75 18                	jne    bc <strcmp+0x2c>
  a4:	eb 22                	jmp    c8 <strcmp+0x38>
  a6:	8d 76 00             	lea    0x0(%esi),%esi
  a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
  b0:	41                   	inc    %ecx
  while(*p && *p == *q)
  b1:	0f b6 01             	movzbl (%ecx),%eax
    p++, q++;
  b4:	43                   	inc    %ebx
  b5:	0f b6 13             	movzbl (%ebx),%edx
  while(*p && *p == *q)
  b8:	84 c0                	test   %al,%al
  ba:	74 0c                	je     c8 <strcmp+0x38>
  bc:	38 d0                	cmp    %dl,%al
  be:	74 f0                	je     b0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
}
  c0:	5b                   	pop    %ebx
  return (uchar)*p - (uchar)*q;
  c1:	29 d0                	sub    %edx,%eax
}
  c3:	5d                   	pop    %ebp
  c4:	c3                   	ret    
  c5:	8d 76 00             	lea    0x0(%esi),%esi
  c8:	5b                   	pop    %ebx
  c9:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  cb:	29 d0                	sub    %edx,%eax
}
  cd:	5d                   	pop    %ebp
  ce:	c3                   	ret    
  cf:	90                   	nop

000000d0 <strlen>:

uint
strlen(const char *s)
{
  d0:	55                   	push   %ebp
  d1:	89 e5                	mov    %esp,%ebp
  d3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  d6:	80 39 00             	cmpb   $0x0,(%ecx)
  d9:	74 15                	je     f0 <strlen+0x20>
  db:	31 d2                	xor    %edx,%edx
  dd:	8d 76 00             	lea    0x0(%esi),%esi
  e0:	42                   	inc    %edx
  e1:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
  e5:	89 d0                	mov    %edx,%eax
  e7:	75 f7                	jne    e0 <strlen+0x10>
    ;
  return n;
}
  e9:	5d                   	pop    %ebp
  ea:	c3                   	ret    
  eb:	90                   	nop
  ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(n = 0; s[n]; n++)
  f0:	31 c0                	xor    %eax,%eax
}
  f2:	5d                   	pop    %ebp
  f3:	c3                   	ret    
  f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000100 <memset>:

void*
memset(void *dst, int c, uint n)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	8b 55 08             	mov    0x8(%ebp),%edx
 106:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 107:	8b 4d 10             	mov    0x10(%ebp),%ecx
 10a:	8b 45 0c             	mov    0xc(%ebp),%eax
 10d:	89 d7                	mov    %edx,%edi
 10f:	fc                   	cld    
 110:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 112:	5f                   	pop    %edi
 113:	89 d0                	mov    %edx,%eax
 115:	5d                   	pop    %ebp
 116:	c3                   	ret    
 117:	89 f6                	mov    %esi,%esi
 119:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000120 <strchr>:

char*
strchr(const char *s, char c)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	8b 45 08             	mov    0x8(%ebp),%eax
 126:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 12a:	0f b6 10             	movzbl (%eax),%edx
 12d:	84 d2                	test   %dl,%dl
 12f:	74 1b                	je     14c <strchr+0x2c>
    if(*s == c)
 131:	38 d1                	cmp    %dl,%cl
 133:	75 0f                	jne    144 <strchr+0x24>
 135:	eb 17                	jmp    14e <strchr+0x2e>
 137:	89 f6                	mov    %esi,%esi
 139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 140:	38 ca                	cmp    %cl,%dl
 142:	74 0a                	je     14e <strchr+0x2e>
  for(; *s; s++)
 144:	40                   	inc    %eax
 145:	0f b6 10             	movzbl (%eax),%edx
 148:	84 d2                	test   %dl,%dl
 14a:	75 f4                	jne    140 <strchr+0x20>
      return (char*)s;
  return 0;
 14c:	31 c0                	xor    %eax,%eax
}
 14e:	5d                   	pop    %ebp
 14f:	c3                   	ret    

00000150 <gets>:

char*
gets(char *buf, int max)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	57                   	push   %edi
 154:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 155:	31 f6                	xor    %esi,%esi
{
 157:	53                   	push   %ebx
 158:	83 ec 3c             	sub    $0x3c,%esp
 15b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    cc = read(0, &c, 1);
 15e:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
 161:	eb 32                	jmp    195 <gets+0x45>
 163:	90                   	nop
 164:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cc = read(0, &c, 1);
 168:	ba 01 00 00 00       	mov    $0x1,%edx
 16d:	89 54 24 08          	mov    %edx,0x8(%esp)
 171:	89 7c 24 04          	mov    %edi,0x4(%esp)
 175:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 17c:	e8 2f 01 00 00       	call   2b0 <read>
    if(cc < 1)
 181:	85 c0                	test   %eax,%eax
 183:	7e 19                	jle    19e <gets+0x4e>
      break;
    buf[i++] = c;
 185:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 189:	43                   	inc    %ebx
 18a:	88 43 ff             	mov    %al,-0x1(%ebx)
    if(c == '\n' || c == '\r')
 18d:	3c 0a                	cmp    $0xa,%al
 18f:	74 1f                	je     1b0 <gets+0x60>
 191:	3c 0d                	cmp    $0xd,%al
 193:	74 1b                	je     1b0 <gets+0x60>
  for(i=0; i+1 < max; ){
 195:	46                   	inc    %esi
 196:	3b 75 0c             	cmp    0xc(%ebp),%esi
 199:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
 19c:	7c ca                	jl     168 <gets+0x18>
      break;
  }
  buf[i] = '\0';
 19e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 1a1:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
}
 1a4:	8b 45 08             	mov    0x8(%ebp),%eax
 1a7:	83 c4 3c             	add    $0x3c,%esp
 1aa:	5b                   	pop    %ebx
 1ab:	5e                   	pop    %esi
 1ac:	5f                   	pop    %edi
 1ad:	5d                   	pop    %ebp
 1ae:	c3                   	ret    
 1af:	90                   	nop
 1b0:	8b 45 08             	mov    0x8(%ebp),%eax
 1b3:	01 c6                	add    %eax,%esi
 1b5:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 1b8:	eb e4                	jmp    19e <gets+0x4e>
 1ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000001c0 <stat>:

int
stat(const char *n, struct stat *st)
{
 1c0:	55                   	push   %ebp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1c1:	31 c0                	xor    %eax,%eax
{
 1c3:	89 e5                	mov    %esp,%ebp
 1c5:	83 ec 18             	sub    $0x18,%esp
  fd = open(n, O_RDONLY);
 1c8:	89 44 24 04          	mov    %eax,0x4(%esp)
 1cc:	8b 45 08             	mov    0x8(%ebp),%eax
{
 1cf:	89 5d f8             	mov    %ebx,-0x8(%ebp)
 1d2:	89 75 fc             	mov    %esi,-0x4(%ebp)
  fd = open(n, O_RDONLY);
 1d5:	89 04 24             	mov    %eax,(%esp)
 1d8:	e8 fb 00 00 00       	call   2d8 <open>
  if(fd < 0)
 1dd:	85 c0                	test   %eax,%eax
 1df:	78 2f                	js     210 <stat+0x50>
 1e1:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
 1e3:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e6:	89 1c 24             	mov    %ebx,(%esp)
 1e9:	89 44 24 04          	mov    %eax,0x4(%esp)
 1ed:	e8 fe 00 00 00       	call   2f0 <fstat>
  close(fd);
 1f2:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 1f5:	89 c6                	mov    %eax,%esi
  close(fd);
 1f7:	e8 c4 00 00 00       	call   2c0 <close>
  return r;
}
 1fc:	89 f0                	mov    %esi,%eax
 1fe:	8b 5d f8             	mov    -0x8(%ebp),%ebx
 201:	8b 75 fc             	mov    -0x4(%ebp),%esi
 204:	89 ec                	mov    %ebp,%esp
 206:	5d                   	pop    %ebp
 207:	c3                   	ret    
 208:	90                   	nop
 209:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 210:	be ff ff ff ff       	mov    $0xffffffff,%esi
 215:	eb e5                	jmp    1fc <stat+0x3c>
 217:	89 f6                	mov    %esi,%esi
 219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000220 <atoi>:

int
atoi(const char *s)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	8b 4d 08             	mov    0x8(%ebp),%ecx
 226:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 227:	0f be 11             	movsbl (%ecx),%edx
 22a:	88 d0                	mov    %dl,%al
 22c:	2c 30                	sub    $0x30,%al
 22e:	3c 09                	cmp    $0x9,%al
  n = 0;
 230:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 235:	77 1e                	ja     255 <atoi+0x35>
 237:	89 f6                	mov    %esi,%esi
 239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 240:	41                   	inc    %ecx
 241:	8d 04 80             	lea    (%eax,%eax,4),%eax
 244:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 248:	0f be 11             	movsbl (%ecx),%edx
 24b:	88 d3                	mov    %dl,%bl
 24d:	80 eb 30             	sub    $0x30,%bl
 250:	80 fb 09             	cmp    $0x9,%bl
 253:	76 eb                	jbe    240 <atoi+0x20>
  return n;
}
 255:	5b                   	pop    %ebx
 256:	5d                   	pop    %ebp
 257:	c3                   	ret    
 258:	90                   	nop
 259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000260 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	56                   	push   %esi
 264:	8b 45 08             	mov    0x8(%ebp),%eax
 267:	53                   	push   %ebx
 268:	8b 5d 10             	mov    0x10(%ebp),%ebx
 26b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 26e:	85 db                	test   %ebx,%ebx
 270:	7e 1a                	jle    28c <memmove+0x2c>
 272:	31 d2                	xor    %edx,%edx
 274:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 27a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi
    *dst++ = *src++;
 280:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 284:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 287:	42                   	inc    %edx
  while(n-- > 0)
 288:	39 d3                	cmp    %edx,%ebx
 28a:	75 f4                	jne    280 <memmove+0x20>
  return vdst;
}
 28c:	5b                   	pop    %ebx
 28d:	5e                   	pop    %esi
 28e:	5d                   	pop    %ebp
 28f:	c3                   	ret    

00000290 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 290:	b8 01 00 00 00       	mov    $0x1,%eax
 295:	cd 40                	int    $0x40
 297:	c3                   	ret    

00000298 <exit>:
SYSCALL(exit)
 298:	b8 02 00 00 00       	mov    $0x2,%eax
 29d:	cd 40                	int    $0x40
 29f:	c3                   	ret    

000002a0 <wait>:
SYSCALL(wait)
 2a0:	b8 03 00 00 00       	mov    $0x3,%eax
 2a5:	cd 40                	int    $0x40
 2a7:	c3                   	ret    

000002a8 <pipe>:
SYSCALL(pipe)
 2a8:	b8 04 00 00 00       	mov    $0x4,%eax
 2ad:	cd 40                	int    $0x40
 2af:	c3                   	ret    

000002b0 <read>:
SYSCALL(read)
 2b0:	b8 05 00 00 00       	mov    $0x5,%eax
 2b5:	cd 40                	int    $0x40
 2b7:	c3                   	ret    

000002b8 <write>:
SYSCALL(write)
 2b8:	b8 10 00 00 00       	mov    $0x10,%eax
 2bd:	cd 40                	int    $0x40
 2bf:	c3                   	ret    

000002c0 <close>:
SYSCALL(close)
 2c0:	b8 15 00 00 00       	mov    $0x15,%eax
 2c5:	cd 40                	int    $0x40
 2c7:	c3                   	ret    

000002c8 <kill>:
SYSCALL(kill)
 2c8:	b8 06 00 00 00       	mov    $0x6,%eax
 2cd:	cd 40                	int    $0x40
 2cf:	c3                   	ret    

000002d0 <exec>:
SYSCALL(exec)
 2d0:	b8 07 00 00 00       	mov    $0x7,%eax
 2d5:	cd 40                	int    $0x40
 2d7:	c3                   	ret    

000002d8 <open>:
SYSCALL(open)
 2d8:	b8 0f 00 00 00       	mov    $0xf,%eax
 2dd:	cd 40                	int    $0x40
 2df:	c3                   	ret    

000002e0 <mknod>:
SYSCALL(mknod)
 2e0:	b8 11 00 00 00       	mov    $0x11,%eax
 2e5:	cd 40                	int    $0x40
 2e7:	c3                   	ret    

000002e8 <unlink>:
SYSCALL(unlink)
 2e8:	b8 12 00 00 00       	mov    $0x12,%eax
 2ed:	cd 40                	int    $0x40
 2ef:	c3                   	ret    

000002f0 <fstat>:
SYSCALL(fstat)
 2f0:	b8 08 00 00 00       	mov    $0x8,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <link>:
SYSCALL(link)
 2f8:	b8 13 00 00 00       	mov    $0x13,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <mkdir>:
SYSCALL(mkdir)
 300:	b8 14 00 00 00       	mov    $0x14,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <chdir>:
SYSCALL(chdir)
 308:	b8 09 00 00 00       	mov    $0x9,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <dup>:
SYSCALL(dup)
 310:	b8 0a 00 00 00       	mov    $0xa,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <getpid>:
SYSCALL(getpid)
 318:	b8 0b 00 00 00       	mov    $0xb,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <sbrk>:
SYSCALL(sbrk)
 320:	b8 0c 00 00 00       	mov    $0xc,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <sleep>:
SYSCALL(sleep)
 328:	b8 0d 00 00 00       	mov    $0xd,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <uptime>:
SYSCALL(uptime)
 330:	b8 0e 00 00 00       	mov    $0xe,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <detach>:
SYSCALL(detach)
 338:	b8 16 00 00 00       	mov    $0x16,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	57                   	push   %edi
 344:	56                   	push   %esi
 345:	53                   	push   %ebx
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 346:	89 d3                	mov    %edx,%ebx
 348:	c1 eb 1f             	shr    $0x1f,%ebx
{
 34b:	83 ec 4c             	sub    $0x4c,%esp
  if(sgn && xx < 0){
 34e:	84 db                	test   %bl,%bl
{
 350:	89 45 c0             	mov    %eax,-0x40(%ebp)
 353:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 355:	74 79                	je     3d0 <printint+0x90>
 357:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 35b:	74 73                	je     3d0 <printint+0x90>
    neg = 1;
    x = -xx;
 35d:	f7 d8                	neg    %eax
    neg = 1;
 35f:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 366:	31 f6                	xor    %esi,%esi
 368:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 36b:	eb 05                	jmp    372 <printint+0x32>
 36d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 370:	89 fe                	mov    %edi,%esi
 372:	31 d2                	xor    %edx,%edx
 374:	f7 f1                	div    %ecx
 376:	8d 7e 01             	lea    0x1(%esi),%edi
 379:	0f b6 92 74 07 00 00 	movzbl 0x774(%edx),%edx
  }while((x /= base) != 0);
 380:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 382:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 385:	75 e9                	jne    370 <printint+0x30>
  if(neg)
 387:	8b 55 c4             	mov    -0x3c(%ebp),%edx
 38a:	85 d2                	test   %edx,%edx
 38c:	74 08                	je     396 <printint+0x56>
    buf[i++] = '-';
 38e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 393:	8d 7e 02             	lea    0x2(%esi),%edi
 396:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 39a:	8b 7d c0             	mov    -0x40(%ebp),%edi
 39d:	8d 76 00             	lea    0x0(%esi),%esi
 3a0:	0f b6 06             	movzbl (%esi),%eax
 3a3:	4e                   	dec    %esi
  write(fd, &c, 1);
 3a4:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 3a8:	89 3c 24             	mov    %edi,(%esp)
 3ab:	88 45 d7             	mov    %al,-0x29(%ebp)
 3ae:	b8 01 00 00 00       	mov    $0x1,%eax
 3b3:	89 44 24 08          	mov    %eax,0x8(%esp)
 3b7:	e8 fc fe ff ff       	call   2b8 <write>

  while(--i >= 0)
 3bc:	39 de                	cmp    %ebx,%esi
 3be:	75 e0                	jne    3a0 <printint+0x60>
    putc(fd, buf[i]);
}
 3c0:	83 c4 4c             	add    $0x4c,%esp
 3c3:	5b                   	pop    %ebx
 3c4:	5e                   	pop    %esi
 3c5:	5f                   	pop    %edi
 3c6:	5d                   	pop    %ebp
 3c7:	c3                   	ret    
 3c8:	90                   	nop
 3c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 3d0:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 3d7:	eb 8d                	jmp    366 <printint+0x26>
 3d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003e0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	57                   	push   %edi
 3e4:	56                   	push   %esi
 3e5:	53                   	push   %ebx
 3e6:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 3e9:	8b 75 0c             	mov    0xc(%ebp),%esi
 3ec:	0f b6 1e             	movzbl (%esi),%ebx
 3ef:	84 db                	test   %bl,%bl
 3f1:	0f 84 d1 00 00 00    	je     4c8 <printf+0xe8>
  state = 0;
 3f7:	31 ff                	xor    %edi,%edi
 3f9:	46                   	inc    %esi
  ap = (uint*)(void*)&fmt + 1;
 3fa:	8d 45 10             	lea    0x10(%ebp),%eax
  write(fd, &c, 1);
 3fd:	89 fa                	mov    %edi,%edx
 3ff:	8b 7d 08             	mov    0x8(%ebp),%edi
  ap = (uint*)(void*)&fmt + 1;
 402:	89 45 d0             	mov    %eax,-0x30(%ebp)
 405:	eb 41                	jmp    448 <printf+0x68>
 407:	89 f6                	mov    %esi,%esi
 409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 410:	83 f8 25             	cmp    $0x25,%eax
 413:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 416:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 41b:	74 1e                	je     43b <printf+0x5b>
  write(fd, &c, 1);
 41d:	b8 01 00 00 00       	mov    $0x1,%eax
 422:	89 44 24 08          	mov    %eax,0x8(%esp)
 426:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 429:	89 44 24 04          	mov    %eax,0x4(%esp)
 42d:	89 3c 24             	mov    %edi,(%esp)
 430:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 433:	e8 80 fe ff ff       	call   2b8 <write>
 438:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 43b:	46                   	inc    %esi
  for(i = 0; fmt[i]; i++){
 43c:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 440:	84 db                	test   %bl,%bl
 442:	0f 84 80 00 00 00    	je     4c8 <printf+0xe8>
    if(state == 0){
 448:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
 44a:	0f be cb             	movsbl %bl,%ecx
 44d:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 450:	74 be                	je     410 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 452:	83 fa 25             	cmp    $0x25,%edx
 455:	75 e4                	jne    43b <printf+0x5b>
      if(c == 'd'){
 457:	83 f8 64             	cmp    $0x64,%eax
 45a:	0f 84 f0 00 00 00    	je     550 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 460:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 466:	83 f9 70             	cmp    $0x70,%ecx
 469:	74 65                	je     4d0 <printf+0xf0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 46b:	83 f8 73             	cmp    $0x73,%eax
 46e:	0f 84 8c 00 00 00    	je     500 <printf+0x120>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 474:	83 f8 63             	cmp    $0x63,%eax
 477:	0f 84 13 01 00 00    	je     590 <printf+0x1b0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 47d:	83 f8 25             	cmp    $0x25,%eax
 480:	0f 84 e2 00 00 00    	je     568 <printf+0x188>
  write(fd, &c, 1);
 486:	b8 01 00 00 00       	mov    $0x1,%eax
 48b:	46                   	inc    %esi
 48c:	89 44 24 08          	mov    %eax,0x8(%esp)
 490:	8d 45 e7             	lea    -0x19(%ebp),%eax
 493:	89 44 24 04          	mov    %eax,0x4(%esp)
 497:	89 3c 24             	mov    %edi,(%esp)
 49a:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 49e:	e8 15 fe ff ff       	call   2b8 <write>
 4a3:	ba 01 00 00 00       	mov    $0x1,%edx
 4a8:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 4ab:	89 54 24 08          	mov    %edx,0x8(%esp)
 4af:	89 44 24 04          	mov    %eax,0x4(%esp)
 4b3:	89 3c 24             	mov    %edi,(%esp)
 4b6:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 4b9:	e8 fa fd ff ff       	call   2b8 <write>
  for(i = 0; fmt[i]; i++){
 4be:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4c2:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 4c4:	84 db                	test   %bl,%bl
 4c6:	75 80                	jne    448 <printf+0x68>
    }
  }
}
 4c8:	83 c4 3c             	add    $0x3c,%esp
 4cb:	5b                   	pop    %ebx
 4cc:	5e                   	pop    %esi
 4cd:	5f                   	pop    %edi
 4ce:	5d                   	pop    %ebp
 4cf:	c3                   	ret    
        printint(fd, *ap, 16, 0);
 4d0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 4d7:	b9 10 00 00 00       	mov    $0x10,%ecx
 4dc:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 4df:	89 f8                	mov    %edi,%eax
 4e1:	8b 13                	mov    (%ebx),%edx
 4e3:	e8 58 fe ff ff       	call   340 <printint>
        ap++;
 4e8:	89 d8                	mov    %ebx,%eax
      state = 0;
 4ea:	31 d2                	xor    %edx,%edx
        ap++;
 4ec:	83 c0 04             	add    $0x4,%eax
 4ef:	89 45 d0             	mov    %eax,-0x30(%ebp)
 4f2:	e9 44 ff ff ff       	jmp    43b <printf+0x5b>
 4f7:	89 f6                	mov    %esi,%esi
 4f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
 500:	8b 45 d0             	mov    -0x30(%ebp),%eax
 503:	8b 10                	mov    (%eax),%edx
        ap++;
 505:	83 c0 04             	add    $0x4,%eax
 508:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 50b:	85 d2                	test   %edx,%edx
 50d:	0f 84 aa 00 00 00    	je     5bd <printf+0x1dd>
        while(*s != 0){
 513:	0f b6 02             	movzbl (%edx),%eax
        s = (char*)*ap;
 516:	89 d3                	mov    %edx,%ebx
        while(*s != 0){
 518:	84 c0                	test   %al,%al
 51a:	74 27                	je     543 <printf+0x163>
 51c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 520:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 523:	b8 01 00 00 00       	mov    $0x1,%eax
          s++;
 528:	43                   	inc    %ebx
  write(fd, &c, 1);
 529:	89 44 24 08          	mov    %eax,0x8(%esp)
 52d:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 530:	89 44 24 04          	mov    %eax,0x4(%esp)
 534:	89 3c 24             	mov    %edi,(%esp)
 537:	e8 7c fd ff ff       	call   2b8 <write>
        while(*s != 0){
 53c:	0f b6 03             	movzbl (%ebx),%eax
 53f:	84 c0                	test   %al,%al
 541:	75 dd                	jne    520 <printf+0x140>
      state = 0;
 543:	31 d2                	xor    %edx,%edx
 545:	e9 f1 fe ff ff       	jmp    43b <printf+0x5b>
 54a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
 550:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 557:	b9 0a 00 00 00       	mov    $0xa,%ecx
 55c:	e9 7b ff ff ff       	jmp    4dc <printf+0xfc>
 561:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
 568:	b9 01 00 00 00       	mov    $0x1,%ecx
 56d:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 570:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 574:	89 44 24 04          	mov    %eax,0x4(%esp)
 578:	89 3c 24             	mov    %edi,(%esp)
 57b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 57e:	e8 35 fd ff ff       	call   2b8 <write>
      state = 0;
 583:	31 d2                	xor    %edx,%edx
 585:	e9 b1 fe ff ff       	jmp    43b <printf+0x5b>
 58a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, *ap);
 590:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 593:	8b 03                	mov    (%ebx),%eax
        ap++;
 595:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 598:	89 3c 24             	mov    %edi,(%esp)
        putc(fd, *ap);
 59b:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 59e:	b8 01 00 00 00       	mov    $0x1,%eax
 5a3:	89 44 24 08          	mov    %eax,0x8(%esp)
 5a7:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 5aa:	89 44 24 04          	mov    %eax,0x4(%esp)
 5ae:	e8 05 fd ff ff       	call   2b8 <write>
      state = 0;
 5b3:	31 d2                	xor    %edx,%edx
        ap++;
 5b5:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 5b8:	e9 7e fe ff ff       	jmp    43b <printf+0x5b>
          s = "(null)";
 5bd:	bb 6c 07 00 00       	mov    $0x76c,%ebx
        while(*s != 0){
 5c2:	b0 28                	mov    $0x28,%al
 5c4:	e9 57 ff ff ff       	jmp    520 <printf+0x140>
 5c9:	66 90                	xchg   %ax,%ax
 5cb:	66 90                	xchg   %ax,%ax
 5cd:	66 90                	xchg   %ax,%ax
 5cf:	90                   	nop

000005d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5d0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5d1:	a1 04 0a 00 00       	mov    0xa04,%eax
{
 5d6:	89 e5                	mov    %esp,%ebp
 5d8:	57                   	push   %edi
 5d9:	56                   	push   %esi
 5da:	53                   	push   %ebx
 5db:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 5de:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 5e1:	eb 0d                	jmp    5f0 <free+0x20>
 5e3:	90                   	nop
 5e4:	90                   	nop
 5e5:	90                   	nop
 5e6:	90                   	nop
 5e7:	90                   	nop
 5e8:	90                   	nop
 5e9:	90                   	nop
 5ea:	90                   	nop
 5eb:	90                   	nop
 5ec:	90                   	nop
 5ed:	90                   	nop
 5ee:	90                   	nop
 5ef:	90                   	nop
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5f0:	39 c8                	cmp    %ecx,%eax
 5f2:	8b 10                	mov    (%eax),%edx
 5f4:	73 32                	jae    628 <free+0x58>
 5f6:	39 d1                	cmp    %edx,%ecx
 5f8:	72 04                	jb     5fe <free+0x2e>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5fa:	39 d0                	cmp    %edx,%eax
 5fc:	72 32                	jb     630 <free+0x60>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5fe:	8b 73 fc             	mov    -0x4(%ebx),%esi
 601:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 604:	39 fa                	cmp    %edi,%edx
 606:	74 30                	je     638 <free+0x68>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 608:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 60b:	8b 50 04             	mov    0x4(%eax),%edx
 60e:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 611:	39 f1                	cmp    %esi,%ecx
 613:	74 3c                	je     651 <free+0x81>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 615:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 617:	5b                   	pop    %ebx
  freep = p;
 618:	a3 04 0a 00 00       	mov    %eax,0xa04
}
 61d:	5e                   	pop    %esi
 61e:	5f                   	pop    %edi
 61f:	5d                   	pop    %ebp
 620:	c3                   	ret    
 621:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 628:	39 d0                	cmp    %edx,%eax
 62a:	72 04                	jb     630 <free+0x60>
 62c:	39 d1                	cmp    %edx,%ecx
 62e:	72 ce                	jb     5fe <free+0x2e>
{
 630:	89 d0                	mov    %edx,%eax
 632:	eb bc                	jmp    5f0 <free+0x20>
 634:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 638:	8b 7a 04             	mov    0x4(%edx),%edi
 63b:	01 fe                	add    %edi,%esi
 63d:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 640:	8b 10                	mov    (%eax),%edx
 642:	8b 12                	mov    (%edx),%edx
 644:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 647:	8b 50 04             	mov    0x4(%eax),%edx
 64a:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 64d:	39 f1                	cmp    %esi,%ecx
 64f:	75 c4                	jne    615 <free+0x45>
    p->s.size += bp->s.size;
 651:	8b 4b fc             	mov    -0x4(%ebx),%ecx
  freep = p;
 654:	a3 04 0a 00 00       	mov    %eax,0xa04
    p->s.size += bp->s.size;
 659:	01 ca                	add    %ecx,%edx
 65b:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 65e:	8b 53 f8             	mov    -0x8(%ebx),%edx
 661:	89 10                	mov    %edx,(%eax)
}
 663:	5b                   	pop    %ebx
 664:	5e                   	pop    %esi
 665:	5f                   	pop    %edi
 666:	5d                   	pop    %ebp
 667:	c3                   	ret    
 668:	90                   	nop
 669:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000670 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 670:	55                   	push   %ebp
 671:	89 e5                	mov    %esp,%ebp
 673:	57                   	push   %edi
 674:	56                   	push   %esi
 675:	53                   	push   %ebx
 676:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 679:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 67c:	8b 15 04 0a 00 00    	mov    0xa04,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 682:	8d 78 07             	lea    0x7(%eax),%edi
 685:	c1 ef 03             	shr    $0x3,%edi
 688:	47                   	inc    %edi
  if((prevp = freep) == 0){
 689:	85 d2                	test   %edx,%edx
 68b:	0f 84 8f 00 00 00    	je     720 <malloc+0xb0>
 691:	8b 02                	mov    (%edx),%eax
 693:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 696:	39 cf                	cmp    %ecx,%edi
 698:	76 66                	jbe    700 <malloc+0x90>
 69a:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 6a0:	bb 00 10 00 00       	mov    $0x1000,%ebx
 6a5:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 6a8:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 6af:	eb 10                	jmp    6c1 <malloc+0x51>
 6b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6b8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 6ba:	8b 48 04             	mov    0x4(%eax),%ecx
 6bd:	39 f9                	cmp    %edi,%ecx
 6bf:	73 3f                	jae    700 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 6c1:	39 05 04 0a 00 00    	cmp    %eax,0xa04
 6c7:	89 c2                	mov    %eax,%edx
 6c9:	75 ed                	jne    6b8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 6cb:	89 34 24             	mov    %esi,(%esp)
 6ce:	e8 4d fc ff ff       	call   320 <sbrk>
  if(p == (char*)-1)
 6d3:	83 f8 ff             	cmp    $0xffffffff,%eax
 6d6:	74 18                	je     6f0 <malloc+0x80>
  hp->s.size = nu;
 6d8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 6db:	83 c0 08             	add    $0x8,%eax
 6de:	89 04 24             	mov    %eax,(%esp)
 6e1:	e8 ea fe ff ff       	call   5d0 <free>
  return freep;
 6e6:	8b 15 04 0a 00 00    	mov    0xa04,%edx
      if((p = morecore(nunits)) == 0)
 6ec:	85 d2                	test   %edx,%edx
 6ee:	75 c8                	jne    6b8 <malloc+0x48>
        return 0;
  }
}
 6f0:	83 c4 1c             	add    $0x1c,%esp
        return 0;
 6f3:	31 c0                	xor    %eax,%eax
}
 6f5:	5b                   	pop    %ebx
 6f6:	5e                   	pop    %esi
 6f7:	5f                   	pop    %edi
 6f8:	5d                   	pop    %ebp
 6f9:	c3                   	ret    
 6fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 700:	39 cf                	cmp    %ecx,%edi
 702:	74 4c                	je     750 <malloc+0xe0>
        p->s.size -= nunits;
 704:	29 f9                	sub    %edi,%ecx
 706:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 709:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 70c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 70f:	89 15 04 0a 00 00    	mov    %edx,0xa04
}
 715:	83 c4 1c             	add    $0x1c,%esp
      return (void*)(p + 1);
 718:	83 c0 08             	add    $0x8,%eax
}
 71b:	5b                   	pop    %ebx
 71c:	5e                   	pop    %esi
 71d:	5f                   	pop    %edi
 71e:	5d                   	pop    %ebp
 71f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
 720:	b8 08 0a 00 00       	mov    $0xa08,%eax
 725:	ba 08 0a 00 00       	mov    $0xa08,%edx
    base.s.size = 0;
 72a:	31 c9                	xor    %ecx,%ecx
    base.s.ptr = freep = prevp = &base;
 72c:	a3 04 0a 00 00       	mov    %eax,0xa04
    base.s.size = 0;
 731:	b8 08 0a 00 00       	mov    $0xa08,%eax
    base.s.ptr = freep = prevp = &base;
 736:	89 15 08 0a 00 00    	mov    %edx,0xa08
    base.s.size = 0;
 73c:	89 0d 0c 0a 00 00    	mov    %ecx,0xa0c
 742:	e9 53 ff ff ff       	jmp    69a <malloc+0x2a>
 747:	89 f6                	mov    %esi,%esi
 749:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        prevp->s.ptr = p->s.ptr;
 750:	8b 08                	mov    (%eax),%ecx
 752:	89 0a                	mov    %ecx,(%edx)
 754:	eb b9                	jmp    70f <malloc+0x9f>
