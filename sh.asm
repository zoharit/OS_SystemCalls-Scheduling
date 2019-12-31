
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return 0;
}

int
main(void)
{
       0:	55                   	push   %ebp
  static char buf[100];
  int fd;
  int status; 
  int fdPath;
  fdPath=open("path", O_CREATE | O_RDWR);
       1:	b9 02 02 00 00       	mov    $0x202,%ecx
{
       6:	89 e5                	mov    %esp,%ebp
       8:	53                   	push   %ebx
       9:	83 e4 f0             	and    $0xfffffff0,%esp
       c:	83 ec 20             	sub    $0x20,%esp
  fdPath=open("path", O_CREATE | O_RDWR);
       f:	89 4c 24 04          	mov    %ecx,0x4(%esp)
      13:	c7 04 24 73 14 00 00 	movl   $0x1473,(%esp)
      1a:	e8 c9 0f 00 00       	call   fe8 <open>
  mkdir("mor");
      1f:	c7 04 24 0f 15 00 00 	movl   $0x150f,(%esp)
  fdPath=open("path", O_CREATE | O_RDWR);
      26:	89 c3                	mov    %eax,%ebx
  mkdir("mor");
      28:	e8 e3 0f 00 00       	call   1010 <mkdir>
  write(fdPath, "/:/mor/:/bin/:",14);
      2d:	b8 0e 00 00 00       	mov    $0xe,%eax
      32:	89 44 24 08          	mov    %eax,0x8(%esp)
      36:	b8 13 15 00 00       	mov    $0x1513,%eax
      3b:	89 44 24 04          	mov    %eax,0x4(%esp)
      3f:	89 1c 24             	mov    %ebx,(%esp)
      42:	e8 81 0f 00 00       	call   fc8 <write>
  
 // write(Openpath ,"/");
  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      47:	eb 10                	jmp    59 <main+0x59>
      49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(fd >= 3){
      50:	83 f8 02             	cmp    $0x2,%eax
      53:	0f 8f ba 00 00 00    	jg     113 <main+0x113>
  while((fd = open("console", O_RDWR)) >= 0){
      59:	ba 02 00 00 00       	mov    $0x2,%edx
      5e:	89 54 24 04          	mov    %edx,0x4(%esp)
      62:	c7 04 24 22 15 00 00 	movl   $0x1522,(%esp)
      69:	e8 7a 0f 00 00       	call   fe8 <open>
      6e:	85 c0                	test   %eax,%eax
      70:	79 de                	jns    50 <main+0x50>
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }
    if(fork1() == 0)
      runcmd(parsecmd(buf));
    wait(&status);
      72:	8d 5c 24 1c          	lea    0x1c(%esp),%ebx
      76:	eb 26                	jmp    9e <main+0x9e>
      78:	90                   	nop
      79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
int
fork1(void)
{
  int pid;

  pid = fork();
      80:	e8 1b 0f 00 00       	call   fa0 <fork>
  if(pid == -1)
      85:	83 f8 ff             	cmp    $0xffffffff,%eax
      88:	0f 84 a3 00 00 00    	je     131 <main+0x131>
    if(fork1() == 0)
      8e:	85 c0                	test   %eax,%eax
      90:	0f 84 a7 00 00 00    	je     13d <main+0x13d>
    wait(&status);
      96:	89 1c 24             	mov    %ebx,(%esp)
      99:	e8 12 0f 00 00       	call   fb0 <wait>
  while(getcmd(buf, sizeof(buf)) >= 0){
      9e:	b8 64 00 00 00       	mov    $0x64,%eax
      a3:	89 44 24 04          	mov    %eax,0x4(%esp)
      a7:	c7 04 24 40 1b 00 00 	movl   $0x1b40,(%esp)
      ae:	e8 ad 00 00 00       	call   160 <getcmd>
      b3:	85 c0                	test   %eax,%eax
      b5:	78 6e                	js     125 <main+0x125>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      b7:	80 3d 40 1b 00 00 63 	cmpb   $0x63,0x1b40
      be:	75 c0                	jne    80 <main+0x80>
      c0:	80 3d 41 1b 00 00 64 	cmpb   $0x64,0x1b41
      c7:	75 b7                	jne    80 <main+0x80>
      c9:	80 3d 42 1b 00 00 20 	cmpb   $0x20,0x1b42
      d0:	75 ae                	jne    80 <main+0x80>
      buf[strlen(buf)-1] = 0;  // chop \n
      d2:	c7 04 24 40 1b 00 00 	movl   $0x1b40,(%esp)
      d9:	e8 02 0d 00 00       	call   de0 <strlen>
      if(chdir(buf+3) < 0)
      de:	c7 04 24 43 1b 00 00 	movl   $0x1b43,(%esp)
      buf[strlen(buf)-1] = 0;  // chop \n
      e5:	c6 80 3f 1b 00 00 00 	movb   $0x0,0x1b3f(%eax)
      if(chdir(buf+3) < 0)
      ec:	e8 27 0f 00 00       	call   1018 <chdir>
      f1:	85 c0                	test   %eax,%eax
      f3:	79 a9                	jns    9e <main+0x9e>
        printf(2, "cannot cd %s\n", buf+3);
      f5:	c7 44 24 08 43 1b 00 	movl   $0x1b43,0x8(%esp)
      fc:	00 
      fd:	c7 44 24 04 2a 15 00 	movl   $0x152a,0x4(%esp)
     104:	00 
     105:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     10c:	e8 df 0f 00 00       	call   10f0 <printf>
     111:	eb 8b                	jmp    9e <main+0x9e>
      close(fd);
     113:	89 04 24             	mov    %eax,(%esp)
     116:	e8 b5 0e 00 00       	call   fd0 <close>
     11b:	90                   	nop
     11c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      break;
     120:	e9 4d ff ff ff       	jmp    72 <main+0x72>
  exit(0);
     125:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     12c:	e8 77 0e 00 00       	call   fa8 <exit>
    panic("fork");
     131:	c7 04 24 98 14 00 00 	movl   $0x1498,(%esp)
     138:	e8 83 00 00 00       	call   1c0 <panic>
      runcmd(parsecmd(buf));
     13d:	c7 04 24 40 1b 00 00 	movl   $0x1b40,(%esp)
     144:	e8 b7 0b 00 00       	call   d00 <parsecmd>
     149:	89 04 24             	mov    %eax,(%esp)
     14c:	e8 9f 00 00 00       	call   1f0 <runcmd>
     151:	66 90                	xchg   %ax,%ax
     153:	66 90                	xchg   %ax,%ax
     155:	66 90                	xchg   %ax,%ax
     157:	66 90                	xchg   %ax,%ax
     159:	66 90                	xchg   %ax,%ax
     15b:	66 90                	xchg   %ax,%ax
     15d:	66 90                	xchg   %ax,%ax
     15f:	90                   	nop

00000160 <getcmd>:
{
     160:	55                   	push   %ebp
  printf(2, "$ ");
     161:	b8 68 14 00 00       	mov    $0x1468,%eax
{
     166:	89 e5                	mov    %esp,%ebp
     168:	83 ec 18             	sub    $0x18,%esp
     16b:	89 5d f8             	mov    %ebx,-0x8(%ebp)
     16e:	8b 5d 08             	mov    0x8(%ebp),%ebx
     171:	89 75 fc             	mov    %esi,-0x4(%ebp)
     174:	8b 75 0c             	mov    0xc(%ebp),%esi
  printf(2, "$ ");
     177:	89 44 24 04          	mov    %eax,0x4(%esp)
     17b:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     182:	e8 69 0f 00 00       	call   10f0 <printf>
  memset(buf, 0, nbuf);
     187:	31 d2                	xor    %edx,%edx
     189:	89 74 24 08          	mov    %esi,0x8(%esp)
     18d:	89 54 24 04          	mov    %edx,0x4(%esp)
     191:	89 1c 24             	mov    %ebx,(%esp)
     194:	e8 77 0c 00 00       	call   e10 <memset>
  gets(buf, nbuf);
     199:	89 74 24 04          	mov    %esi,0x4(%esp)
     19d:	89 1c 24             	mov    %ebx,(%esp)
     1a0:	e8 bb 0c 00 00       	call   e60 <gets>
  if(buf[0] == 0) // EOF
     1a5:	31 c0                	xor    %eax,%eax
}
     1a7:	8b 75 fc             	mov    -0x4(%ebp),%esi
  if(buf[0] == 0) // EOF
     1aa:	80 3b 00             	cmpb   $0x0,(%ebx)
}
     1ad:	8b 5d f8             	mov    -0x8(%ebp),%ebx
  if(buf[0] == 0) // EOF
     1b0:	0f 94 c0             	sete   %al
}
     1b3:	89 ec                	mov    %ebp,%esp
  if(buf[0] == 0) // EOF
     1b5:	f7 d8                	neg    %eax
}
     1b7:	5d                   	pop    %ebp
     1b8:	c3                   	ret    
     1b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001c0 <panic>:
{
     1c0:	55                   	push   %ebp
     1c1:	89 e5                	mov    %esp,%ebp
     1c3:	83 ec 18             	sub    $0x18,%esp
  printf(2, "%s\n", s);
     1c6:	8b 45 08             	mov    0x8(%ebp),%eax
     1c9:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     1d0:	89 44 24 08          	mov    %eax,0x8(%esp)
     1d4:	b8 0b 15 00 00       	mov    $0x150b,%eax
     1d9:	89 44 24 04          	mov    %eax,0x4(%esp)
     1dd:	e8 0e 0f 00 00       	call   10f0 <printf>
  exit(0);
     1e2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     1e9:	e8 ba 0d 00 00       	call   fa8 <exit>
     1ee:	66 90                	xchg   %ax,%ax

000001f0 <runcmd>:
{
     1f0:	55                   	push   %ebp
     1f1:	89 e5                	mov    %esp,%ebp
     1f3:	57                   	push   %edi
     1f4:	56                   	push   %esi
     1f5:	53                   	push   %ebx
     1f6:	81 ec 3c 02 00 00    	sub    $0x23c,%esp
     1fc:	8b 7d 08             	mov    0x8(%ebp),%edi
  if(cmd == 0)
     1ff:	85 ff                	test   %edi,%edi
     201:	74 5d                	je     260 <runcmd+0x70>
  switch(cmd->type){
     203:	83 3f 05             	cmpl   $0x5,(%edi)
     206:	0f 87 98 01 00 00    	ja     3a4 <runcmd+0x1b4>
     20c:	8b 07                	mov    (%edi),%eax
     20e:	ff 24 85 38 15 00 00 	jmp    *0x1538(,%eax,4)
    close(rcmd->fd);
     215:	8b 47 14             	mov    0x14(%edi),%eax
     218:	89 04 24             	mov    %eax,(%esp)
     21b:	e8 b0 0d 00 00       	call   fd0 <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     220:	8b 47 10             	mov    0x10(%edi),%eax
     223:	89 44 24 04          	mov    %eax,0x4(%esp)
     227:	8b 47 08             	mov    0x8(%edi),%eax
     22a:	89 04 24             	mov    %eax,(%esp)
     22d:	e8 b6 0d 00 00       	call   fe8 <open>
     232:	85 c0                	test   %eax,%eax
     234:	79 48                	jns    27e <runcmd+0x8e>
      printf(2, "open %s failed\n", rcmd->file);
     236:	8b 47 08             	mov    0x8(%edi),%eax
     239:	c7 44 24 04 88 14 00 	movl   $0x1488,0x4(%esp)
     240:	00 
     241:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     248:	89 44 24 08          	mov    %eax,0x8(%esp)
     24c:	e8 9f 0e 00 00       	call   10f0 <printf>
     251:	eb 0d                	jmp    260 <runcmd+0x70>
     253:	90                   	nop
     254:	90                   	nop
     255:	90                   	nop
     256:	90                   	nop
     257:	90                   	nop
     258:	90                   	nop
     259:	90                   	nop
     25a:	90                   	nop
     25b:	90                   	nop
     25c:	90                   	nop
     25d:	90                   	nop
     25e:	90                   	nop
     25f:	90                   	nop
      exit(0);
     260:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     267:	e8 3c 0d 00 00       	call   fa8 <exit>
  pid = fork();
     26c:	e8 2f 0d 00 00       	call   fa0 <fork>
  if(pid == -1)
     271:	83 f8 ff             	cmp    $0xffffffff,%eax
     274:	0f 84 36 01 00 00    	je     3b0 <runcmd+0x1c0>
    if(fork1() == 0)
     27a:	85 c0                	test   %eax,%eax
     27c:	75 e2                	jne    260 <runcmd+0x70>
      runcmd(bcmd->cmd);
     27e:	8b 47 04             	mov    0x4(%edi),%eax
     281:	89 04 24             	mov    %eax,(%esp)
     284:	e8 67 ff ff ff       	call   1f0 <runcmd>
    myCmd=ecmd->argv[0];
     289:	8b 47 04             	mov    0x4(%edi),%eax
    if(ecmd->argv[0] == 0){
     28c:	85 c0                	test   %eax,%eax
    myCmd=ecmd->argv[0];
     28e:	89 85 d4 fd ff ff    	mov    %eax,-0x22c(%ebp)
    if(ecmd->argv[0] == 0){
     294:	74 ca                	je     260 <runcmd+0x70>
    exec(ecmd->argv[0], ecmd->argv);
     296:	8d 57 04             	lea    0x4(%edi),%edx
  int indexargv = 0;
     299:	31 f6                	xor    %esi,%esi
    exec(ecmd->argv[0], ecmd->argv);
     29b:	89 54 24 04          	mov    %edx,0x4(%esp)
     29f:	89 04 24             	mov    %eax,(%esp)
     2a2:	89 95 d0 fd ff ff    	mov    %edx,-0x230(%ebp)
     2a8:	e8 33 0d 00 00       	call   fe0 <exec>
    fd = open("/path", O_RDONLY);
     2ad:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     2b4:	00 
     2b5:	c7 04 24 72 14 00 00 	movl   $0x1472,(%esp)
     2bc:	e8 27 0d 00 00       	call   fe8 <open>
     2c1:	89 c3                	mov    %eax,%ebx
    while(read(fd, data, 1) > 0){
     2c3:	8d 85 db fd ff ff    	lea    -0x225(%ebp),%eax
     2c9:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     2d0:	00 
     2d1:	89 44 24 04          	mov    %eax,0x4(%esp)
     2d5:	89 1c 24             	mov    %ebx,(%esp)
     2d8:	e8 e3 0c 00 00       	call   fc0 <read>
     2dd:	85 c0                	test   %eax,%eax
     2df:	0f 8e 26 01 00 00    	jle    40b <runcmd+0x21b>
      if(data[0]!=':'){
     2e5:	0f b6 85 db fd ff ff 	movzbl -0x225(%ebp),%eax
     2ec:	3c 3a                	cmp    $0x3a,%al
     2ee:	0f 84 c8 00 00 00    	je     3bc <runcmd+0x1cc>
          strPath[indexargv]=data[0];
     2f4:	88 84 35 e8 fd ff ff 	mov    %al,-0x218(%ebp,%esi,1)
          indexargv++;   
     2fb:	46                   	inc    %esi
     2fc:	eb c5                	jmp    2c3 <runcmd+0xd3>
    if(pipe(p) < 0)
     2fe:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
     304:	89 04 24             	mov    %eax,(%esp)
     307:	e8 ac 0c 00 00       	call   fb8 <pipe>
     30c:	85 c0                	test   %eax,%eax
     30e:	0f 88 60 01 00 00    	js     474 <runcmd+0x284>
  pid = fork();
     314:	e8 87 0c 00 00       	call   fa0 <fork>
  if(pid == -1)
     319:	83 f8 ff             	cmp    $0xffffffff,%eax
     31c:	0f 84 8e 00 00 00    	je     3b0 <runcmd+0x1c0>
    if(fork1() == 0){
     322:	85 c0                	test   %eax,%eax
     324:	0f 84 56 01 00 00    	je     480 <runcmd+0x290>
     32a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  pid = fork();
     330:	e8 6b 0c 00 00       	call   fa0 <fork>
  if(pid == -1)
     335:	83 f8 ff             	cmp    $0xffffffff,%eax
     338:	74 76                	je     3b0 <runcmd+0x1c0>
    if(fork1() == 0){
     33a:	85 c0                	test   %eax,%eax
     33c:	0f 84 f1 00 00 00    	je     433 <runcmd+0x243>
    close(p[0]);
     342:	8b 85 e0 fd ff ff    	mov    -0x220(%ebp),%eax
    wait(&status);
     348:	8d 9d dc fd ff ff    	lea    -0x224(%ebp),%ebx
    close(p[0]);
     34e:	89 04 24             	mov    %eax,(%esp)
     351:	e8 7a 0c 00 00       	call   fd0 <close>
    close(p[1]);
     356:	8b 85 e4 fd ff ff    	mov    -0x21c(%ebp),%eax
     35c:	89 04 24             	mov    %eax,(%esp)
     35f:	e8 6c 0c 00 00       	call   fd0 <close>
    wait(&status);
     364:	89 1c 24             	mov    %ebx,(%esp)
     367:	e8 44 0c 00 00       	call   fb0 <wait>
    wait(&status);
     36c:	89 1c 24             	mov    %ebx,(%esp)
     36f:	e8 3c 0c 00 00       	call   fb0 <wait>
    break;
     374:	e9 e7 fe ff ff       	jmp    260 <runcmd+0x70>
  pid = fork();
     379:	e8 22 0c 00 00       	call   fa0 <fork>
  if(pid == -1)
     37e:	83 f8 ff             	cmp    $0xffffffff,%eax
     381:	74 2d                	je     3b0 <runcmd+0x1c0>
    if(fork1() == 0)
     383:	85 c0                	test   %eax,%eax
     385:	0f 84 f3 fe ff ff    	je     27e <runcmd+0x8e>
    wait(&status);
     38b:	8d 85 dc fd ff ff    	lea    -0x224(%ebp),%eax
     391:	89 04 24             	mov    %eax,(%esp)
     394:	e8 17 0c 00 00       	call   fb0 <wait>
    runcmd(lcmd->right);
     399:	8b 47 08             	mov    0x8(%edi),%eax
     39c:	89 04 24             	mov    %eax,(%esp)
     39f:	e8 4c fe ff ff       	call   1f0 <runcmd>
    panic("runcmd");
     3a4:	c7 04 24 6b 14 00 00 	movl   $0x146b,(%esp)
     3ab:	e8 10 fe ff ff       	call   1c0 <panic>
    panic("fork");
     3b0:	c7 04 24 98 14 00 00 	movl   $0x1498,(%esp)
     3b7:	e8 04 fe ff ff       	call   1c0 <panic>
        strcpy(strPath+indexargv,myCmd);
     3bc:	8b 85 d4 fd ff ff    	mov    -0x22c(%ebp),%eax
     3c2:	89 44 24 04          	mov    %eax,0x4(%esp)
     3c6:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
     3cc:	01 c6                	add    %eax,%esi
     3ce:	89 34 24             	mov    %esi,(%esp)
        indexargv = 0;
     3d1:	31 f6                	xor    %esi,%esi
        strcpy(strPath+indexargv,myCmd);
     3d3:	e8 a8 09 00 00       	call   d80 <strcpy>
        exec(strPath, ecmd->argv);
     3d8:	8b 85 d0 fd ff ff    	mov    -0x230(%ebp),%eax
     3de:	89 44 24 04          	mov    %eax,0x4(%esp)
     3e2:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
     3e8:	89 04 24             	mov    %eax,(%esp)
     3eb:	e8 f0 0b 00 00       	call   fe0 <exec>
         strcpy(strPath,"");
     3f0:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
     3f6:	c7 44 24 04 87 14 00 	movl   $0x1487,0x4(%esp)
     3fd:	00 
     3fe:	89 04 24             	mov    %eax,(%esp)
     401:	e8 7a 09 00 00       	call   d80 <strcpy>
     406:	e9 b8 fe ff ff       	jmp    2c3 <runcmd+0xd3>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     40b:	8b 47 04             	mov    0x4(%edi),%eax
     40e:	c7 44 24 04 78 14 00 	movl   $0x1478,0x4(%esp)
     415:	00 
     416:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     41d:	89 44 24 08          	mov    %eax,0x8(%esp)
     421:	e8 ca 0c 00 00       	call   10f0 <printf>
    close(fd);   
     426:	89 1c 24             	mov    %ebx,(%esp)
     429:	e8 a2 0b 00 00       	call   fd0 <close>
    break;
     42e:	e9 2d fe ff ff       	jmp    260 <runcmd+0x70>
      close(0);
     433:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     43a:	e8 91 0b 00 00       	call   fd0 <close>
      dup(p[0]);
     43f:	8b 85 e0 fd ff ff    	mov    -0x220(%ebp),%eax
     445:	89 04 24             	mov    %eax,(%esp)
     448:	e8 d3 0b 00 00       	call   1020 <dup>
      close(p[0]);
     44d:	8b 85 e0 fd ff ff    	mov    -0x220(%ebp),%eax
     453:	89 04 24             	mov    %eax,(%esp)
     456:	e8 75 0b 00 00       	call   fd0 <close>
      close(p[1]);
     45b:	8b 85 e4 fd ff ff    	mov    -0x21c(%ebp),%eax
     461:	89 04 24             	mov    %eax,(%esp)
     464:	e8 67 0b 00 00       	call   fd0 <close>
      runcmd(pcmd->right);
     469:	8b 47 08             	mov    0x8(%edi),%eax
     46c:	89 04 24             	mov    %eax,(%esp)
     46f:	e8 7c fd ff ff       	call   1f0 <runcmd>
      panic("pipe");
     474:	c7 04 24 9d 14 00 00 	movl   $0x149d,(%esp)
     47b:	e8 40 fd ff ff       	call   1c0 <panic>
      close(1);
     480:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     487:	e8 44 0b 00 00       	call   fd0 <close>
      dup(p[1]);
     48c:	8b 85 e4 fd ff ff    	mov    -0x21c(%ebp),%eax
     492:	89 04 24             	mov    %eax,(%esp)
     495:	e8 86 0b 00 00       	call   1020 <dup>
      close(p[0]);
     49a:	8b 85 e0 fd ff ff    	mov    -0x220(%ebp),%eax
     4a0:	89 04 24             	mov    %eax,(%esp)
     4a3:	e8 28 0b 00 00       	call   fd0 <close>
      close(p[1]);
     4a8:	8b 85 e4 fd ff ff    	mov    -0x21c(%ebp),%eax
     4ae:	89 04 24             	mov    %eax,(%esp)
     4b1:	e8 1a 0b 00 00       	call   fd0 <close>
      runcmd(pcmd->left);
     4b6:	8b 47 04             	mov    0x4(%edi),%eax
     4b9:	89 04 24             	mov    %eax,(%esp)
     4bc:	e8 2f fd ff ff       	call   1f0 <runcmd>
     4c1:	eb 0d                	jmp    4d0 <fork1>
     4c3:	90                   	nop
     4c4:	90                   	nop
     4c5:	90                   	nop
     4c6:	90                   	nop
     4c7:	90                   	nop
     4c8:	90                   	nop
     4c9:	90                   	nop
     4ca:	90                   	nop
     4cb:	90                   	nop
     4cc:	90                   	nop
     4cd:	90                   	nop
     4ce:	90                   	nop
     4cf:	90                   	nop

000004d0 <fork1>:
{
     4d0:	55                   	push   %ebp
     4d1:	89 e5                	mov    %esp,%ebp
     4d3:	83 ec 18             	sub    $0x18,%esp
  pid = fork();
     4d6:	e8 c5 0a 00 00       	call   fa0 <fork>
  if(pid == -1)
     4db:	83 f8 ff             	cmp    $0xffffffff,%eax
     4de:	74 02                	je     4e2 <fork1+0x12>
  return pid;
}
     4e0:	c9                   	leave  
     4e1:	c3                   	ret    
    panic("fork");
     4e2:	c7 04 24 98 14 00 00 	movl   $0x1498,(%esp)
     4e9:	e8 d2 fc ff ff       	call   1c0 <panic>
     4ee:	66 90                	xchg   %ax,%ax

000004f0 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     4f0:	55                   	push   %ebp
     4f1:	89 e5                	mov    %esp,%ebp
     4f3:	53                   	push   %ebx
     4f4:	83 ec 14             	sub    $0x14,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     4f7:	c7 04 24 54 00 00 00 	movl   $0x54,(%esp)
     4fe:	e8 7d 0e 00 00       	call   1380 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     503:	31 d2                	xor    %edx,%edx
     505:	89 54 24 04          	mov    %edx,0x4(%esp)
  cmd = malloc(sizeof(*cmd));
     509:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     50b:	b8 54 00 00 00       	mov    $0x54,%eax
     510:	89 1c 24             	mov    %ebx,(%esp)
     513:	89 44 24 08          	mov    %eax,0x8(%esp)
     517:	e8 f4 08 00 00       	call   e10 <memset>
  cmd->type = EXEC;
  return (struct cmd*)cmd;
}
     51c:	89 d8                	mov    %ebx,%eax
  cmd->type = EXEC;
     51e:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
}
     524:	83 c4 14             	add    $0x14,%esp
     527:	5b                   	pop    %ebx
     528:	5d                   	pop    %ebp
     529:	c3                   	ret    
     52a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000530 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     530:	55                   	push   %ebp
     531:	89 e5                	mov    %esp,%ebp
     533:	53                   	push   %ebx
     534:	83 ec 14             	sub    $0x14,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     537:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
     53e:	e8 3d 0e 00 00       	call   1380 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     543:	31 d2                	xor    %edx,%edx
     545:	89 54 24 04          	mov    %edx,0x4(%esp)
  cmd = malloc(sizeof(*cmd));
     549:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     54b:	b8 18 00 00 00       	mov    $0x18,%eax
     550:	89 1c 24             	mov    %ebx,(%esp)
     553:	89 44 24 08          	mov    %eax,0x8(%esp)
     557:	e8 b4 08 00 00       	call   e10 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     55c:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = REDIR;
     55f:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     565:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     568:	8b 45 0c             	mov    0xc(%ebp),%eax
     56b:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     56e:	8b 45 10             	mov    0x10(%ebp),%eax
     571:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     574:	8b 45 14             	mov    0x14(%ebp),%eax
     577:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     57a:	8b 45 18             	mov    0x18(%ebp),%eax
     57d:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     580:	83 c4 14             	add    $0x14,%esp
     583:	89 d8                	mov    %ebx,%eax
     585:	5b                   	pop    %ebx
     586:	5d                   	pop    %ebp
     587:	c3                   	ret    
     588:	90                   	nop
     589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000590 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     590:	55                   	push   %ebp
     591:	89 e5                	mov    %esp,%ebp
     593:	53                   	push   %ebx
     594:	83 ec 14             	sub    $0x14,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     597:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     59e:	e8 dd 0d 00 00       	call   1380 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     5a3:	31 d2                	xor    %edx,%edx
     5a5:	89 54 24 04          	mov    %edx,0x4(%esp)
  cmd = malloc(sizeof(*cmd));
     5a9:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     5ab:	b8 0c 00 00 00       	mov    $0xc,%eax
     5b0:	89 1c 24             	mov    %ebx,(%esp)
     5b3:	89 44 24 08          	mov    %eax,0x8(%esp)
     5b7:	e8 54 08 00 00       	call   e10 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     5bc:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = PIPE;
     5bf:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     5c5:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     5c8:	8b 45 0c             	mov    0xc(%ebp),%eax
     5cb:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     5ce:	83 c4 14             	add    $0x14,%esp
     5d1:	89 d8                	mov    %ebx,%eax
     5d3:	5b                   	pop    %ebx
     5d4:	5d                   	pop    %ebp
     5d5:	c3                   	ret    
     5d6:	8d 76 00             	lea    0x0(%esi),%esi
     5d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000005e0 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     5e0:	55                   	push   %ebp
     5e1:	89 e5                	mov    %esp,%ebp
     5e3:	53                   	push   %ebx
     5e4:	83 ec 14             	sub    $0x14,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     5e7:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     5ee:	e8 8d 0d 00 00       	call   1380 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     5f3:	31 d2                	xor    %edx,%edx
     5f5:	89 54 24 04          	mov    %edx,0x4(%esp)
  cmd = malloc(sizeof(*cmd));
     5f9:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     5fb:	b8 0c 00 00 00       	mov    $0xc,%eax
     600:	89 1c 24             	mov    %ebx,(%esp)
     603:	89 44 24 08          	mov    %eax,0x8(%esp)
     607:	e8 04 08 00 00       	call   e10 <memset>
  cmd->type = LIST;
  cmd->left = left;
     60c:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = LIST;
     60f:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     615:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     618:	8b 45 0c             	mov    0xc(%ebp),%eax
     61b:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     61e:	83 c4 14             	add    $0x14,%esp
     621:	89 d8                	mov    %ebx,%eax
     623:	5b                   	pop    %ebx
     624:	5d                   	pop    %ebp
     625:	c3                   	ret    
     626:	8d 76 00             	lea    0x0(%esi),%esi
     629:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000630 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     630:	55                   	push   %ebp
     631:	89 e5                	mov    %esp,%ebp
     633:	53                   	push   %ebx
     634:	83 ec 14             	sub    $0x14,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     637:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     63e:	e8 3d 0d 00 00       	call   1380 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     643:	31 d2                	xor    %edx,%edx
     645:	89 54 24 04          	mov    %edx,0x4(%esp)
  cmd = malloc(sizeof(*cmd));
     649:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     64b:	b8 08 00 00 00       	mov    $0x8,%eax
     650:	89 1c 24             	mov    %ebx,(%esp)
     653:	89 44 24 08          	mov    %eax,0x8(%esp)
     657:	e8 b4 07 00 00       	call   e10 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     65c:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = BACK;
     65f:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     665:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     668:	83 c4 14             	add    $0x14,%esp
     66b:	89 d8                	mov    %ebx,%eax
     66d:	5b                   	pop    %ebx
     66e:	5d                   	pop    %ebp
     66f:	c3                   	ret    

00000670 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     670:	55                   	push   %ebp
     671:	89 e5                	mov    %esp,%ebp
     673:	57                   	push   %edi
     674:	56                   	push   %esi
     675:	53                   	push   %ebx
     676:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int ret;

  s = *ps;
     679:	8b 45 08             	mov    0x8(%ebp),%eax
{
     67c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     67f:	8b 7d 10             	mov    0x10(%ebp),%edi
  s = *ps;
     682:	8b 30                	mov    (%eax),%esi
  while(s < es && strchr(whitespace, *s))
     684:	39 de                	cmp    %ebx,%esi
     686:	72 0d                	jb     695 <gettoken+0x25>
     688:	eb 22                	jmp    6ac <gettoken+0x3c>
     68a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     690:	46                   	inc    %esi
  while(s < es && strchr(whitespace, *s))
     691:	39 f3                	cmp    %esi,%ebx
     693:	74 17                	je     6ac <gettoken+0x3c>
     695:	0f be 06             	movsbl (%esi),%eax
     698:	c7 04 24 28 1b 00 00 	movl   $0x1b28,(%esp)
     69f:	89 44 24 04          	mov    %eax,0x4(%esp)
     6a3:	e8 88 07 00 00       	call   e30 <strchr>
     6a8:	85 c0                	test   %eax,%eax
     6aa:	75 e4                	jne    690 <gettoken+0x20>
  if(q)
     6ac:	85 ff                	test   %edi,%edi
     6ae:	74 02                	je     6b2 <gettoken+0x42>
    *q = s;
     6b0:	89 37                	mov    %esi,(%edi)
  ret = *s;
     6b2:	0f be 06             	movsbl (%esi),%eax
  switch(*s){
     6b5:	3c 29                	cmp    $0x29,%al
     6b7:	7f 57                	jg     710 <gettoken+0xa0>
     6b9:	3c 28                	cmp    $0x28,%al
     6bb:	0f 8d cb 00 00 00    	jge    78c <gettoken+0x11c>
     6c1:	31 ff                	xor    %edi,%edi
     6c3:	84 c0                	test   %al,%al
     6c5:	0f 85 cd 00 00 00    	jne    798 <gettoken+0x128>
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     6cb:	8b 55 14             	mov    0x14(%ebp),%edx
     6ce:	85 d2                	test   %edx,%edx
     6d0:	74 05                	je     6d7 <gettoken+0x67>
    *eq = s;
     6d2:	8b 45 14             	mov    0x14(%ebp),%eax
     6d5:	89 30                	mov    %esi,(%eax)

  while(s < es && strchr(whitespace, *s))
     6d7:	39 de                	cmp    %ebx,%esi
     6d9:	72 0a                	jb     6e5 <gettoken+0x75>
     6db:	eb 1f                	jmp    6fc <gettoken+0x8c>
     6dd:	8d 76 00             	lea    0x0(%esi),%esi
    s++;
     6e0:	46                   	inc    %esi
  while(s < es && strchr(whitespace, *s))
     6e1:	39 f3                	cmp    %esi,%ebx
     6e3:	74 17                	je     6fc <gettoken+0x8c>
     6e5:	0f be 06             	movsbl (%esi),%eax
     6e8:	c7 04 24 28 1b 00 00 	movl   $0x1b28,(%esp)
     6ef:	89 44 24 04          	mov    %eax,0x4(%esp)
     6f3:	e8 38 07 00 00       	call   e30 <strchr>
     6f8:	85 c0                	test   %eax,%eax
     6fa:	75 e4                	jne    6e0 <gettoken+0x70>
  *ps = s;
     6fc:	8b 45 08             	mov    0x8(%ebp),%eax
     6ff:	89 30                	mov    %esi,(%eax)
  return ret;
}
     701:	83 c4 1c             	add    $0x1c,%esp
     704:	89 f8                	mov    %edi,%eax
     706:	5b                   	pop    %ebx
     707:	5e                   	pop    %esi
     708:	5f                   	pop    %edi
     709:	5d                   	pop    %ebp
     70a:	c3                   	ret    
     70b:	90                   	nop
     70c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
     710:	3c 3e                	cmp    $0x3e,%al
     712:	75 1c                	jne    730 <gettoken+0xc0>
    if(*s == '>'){
     714:	80 7e 01 3e          	cmpb   $0x3e,0x1(%esi)
    s++;
     718:	8d 46 01             	lea    0x1(%esi),%eax
    if(*s == '>'){
     71b:	0f 84 94 00 00 00    	je     7b5 <gettoken+0x145>
    s++;
     721:	89 c6                	mov    %eax,%esi
     723:	bf 3e 00 00 00       	mov    $0x3e,%edi
     728:	eb a1                	jmp    6cb <gettoken+0x5b>
     72a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  switch(*s){
     730:	7f 56                	jg     788 <gettoken+0x118>
     732:	88 c1                	mov    %al,%cl
     734:	80 e9 3b             	sub    $0x3b,%cl
     737:	80 f9 01             	cmp    $0x1,%cl
     73a:	76 50                	jbe    78c <gettoken+0x11c>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     73c:	39 f3                	cmp    %esi,%ebx
     73e:	77 27                	ja     767 <gettoken+0xf7>
     740:	eb 5e                	jmp    7a0 <gettoken+0x130>
     742:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     748:	0f be 06             	movsbl (%esi),%eax
     74b:	c7 04 24 20 1b 00 00 	movl   $0x1b20,(%esp)
     752:	89 44 24 04          	mov    %eax,0x4(%esp)
     756:	e8 d5 06 00 00       	call   e30 <strchr>
     75b:	85 c0                	test   %eax,%eax
     75d:	75 1c                	jne    77b <gettoken+0x10b>
      s++;
     75f:	46                   	inc    %esi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     760:	39 f3                	cmp    %esi,%ebx
     762:	74 3c                	je     7a0 <gettoken+0x130>
     764:	0f be 06             	movsbl (%esi),%eax
     767:	89 44 24 04          	mov    %eax,0x4(%esp)
     76b:	c7 04 24 28 1b 00 00 	movl   $0x1b28,(%esp)
     772:	e8 b9 06 00 00       	call   e30 <strchr>
     777:	85 c0                	test   %eax,%eax
     779:	74 cd                	je     748 <gettoken+0xd8>
    ret = 'a';
     77b:	bf 61 00 00 00       	mov    $0x61,%edi
     780:	e9 46 ff ff ff       	jmp    6cb <gettoken+0x5b>
     785:	8d 76 00             	lea    0x0(%esi),%esi
  switch(*s){
     788:	3c 7c                	cmp    $0x7c,%al
     78a:	75 b0                	jne    73c <gettoken+0xcc>
  ret = *s;
     78c:	0f be f8             	movsbl %al,%edi
    s++;
     78f:	46                   	inc    %esi
    break;
     790:	e9 36 ff ff ff       	jmp    6cb <gettoken+0x5b>
     795:	8d 76 00             	lea    0x0(%esi),%esi
  switch(*s){
     798:	3c 26                	cmp    $0x26,%al
     79a:	75 a0                	jne    73c <gettoken+0xcc>
     79c:	eb ee                	jmp    78c <gettoken+0x11c>
     79e:	66 90                	xchg   %ax,%ax
  if(eq)
     7a0:	8b 45 14             	mov    0x14(%ebp),%eax
     7a3:	bf 61 00 00 00       	mov    $0x61,%edi
     7a8:	85 c0                	test   %eax,%eax
     7aa:	0f 85 22 ff ff ff    	jne    6d2 <gettoken+0x62>
     7b0:	e9 47 ff ff ff       	jmp    6fc <gettoken+0x8c>
      s++;
     7b5:	83 c6 02             	add    $0x2,%esi
      ret = '+';
     7b8:	bf 2b 00 00 00       	mov    $0x2b,%edi
     7bd:	e9 09 ff ff ff       	jmp    6cb <gettoken+0x5b>
     7c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     7c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000007d0 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     7d0:	55                   	push   %ebp
     7d1:	89 e5                	mov    %esp,%ebp
     7d3:	57                   	push   %edi
     7d4:	56                   	push   %esi
     7d5:	53                   	push   %ebx
     7d6:	83 ec 1c             	sub    $0x1c,%esp
     7d9:	8b 7d 08             	mov    0x8(%ebp),%edi
     7dc:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     7df:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     7e1:	39 f3                	cmp    %esi,%ebx
     7e3:	72 10                	jb     7f5 <peek+0x25>
     7e5:	eb 25                	jmp    80c <peek+0x3c>
     7e7:	89 f6                	mov    %esi,%esi
     7e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    s++;
     7f0:	43                   	inc    %ebx
  while(s < es && strchr(whitespace, *s))
     7f1:	39 de                	cmp    %ebx,%esi
     7f3:	74 17                	je     80c <peek+0x3c>
     7f5:	0f be 03             	movsbl (%ebx),%eax
     7f8:	c7 04 24 28 1b 00 00 	movl   $0x1b28,(%esp)
     7ff:	89 44 24 04          	mov    %eax,0x4(%esp)
     803:	e8 28 06 00 00       	call   e30 <strchr>
     808:	85 c0                	test   %eax,%eax
     80a:	75 e4                	jne    7f0 <peek+0x20>
  *ps = s;
     80c:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     80e:	31 c0                	xor    %eax,%eax
     810:	0f be 13             	movsbl (%ebx),%edx
     813:	84 d2                	test   %dl,%dl
     815:	74 17                	je     82e <peek+0x5e>
     817:	8b 45 10             	mov    0x10(%ebp),%eax
     81a:	89 54 24 04          	mov    %edx,0x4(%esp)
     81e:	89 04 24             	mov    %eax,(%esp)
     821:	e8 0a 06 00 00       	call   e30 <strchr>
     826:	85 c0                	test   %eax,%eax
     828:	0f 95 c0             	setne  %al
     82b:	0f b6 c0             	movzbl %al,%eax
}
     82e:	83 c4 1c             	add    $0x1c,%esp
     831:	5b                   	pop    %ebx
     832:	5e                   	pop    %esi
     833:	5f                   	pop    %edi
     834:	5d                   	pop    %ebp
     835:	c3                   	ret    
     836:	8d 76 00             	lea    0x0(%esi),%esi
     839:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000840 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     840:	55                   	push   %ebp
     841:	89 e5                	mov    %esp,%ebp
     843:	57                   	push   %edi
     844:	56                   	push   %esi
     845:	53                   	push   %ebx
     846:	83 ec 3c             	sub    $0x3c,%esp
     849:	8b 75 0c             	mov    0xc(%ebp),%esi
     84c:	8b 5d 10             	mov    0x10(%ebp),%ebx
     84f:	90                   	nop
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     850:	b8 bf 14 00 00       	mov    $0x14bf,%eax
     855:	89 44 24 08          	mov    %eax,0x8(%esp)
     859:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     85d:	89 34 24             	mov    %esi,(%esp)
     860:	e8 6b ff ff ff       	call   7d0 <peek>
     865:	85 c0                	test   %eax,%eax
     867:	0f 84 93 00 00 00    	je     900 <parseredirs+0xc0>
    tok = gettoken(ps, es, 0, 0);
     86d:	31 c0                	xor    %eax,%eax
     86f:	89 44 24 0c          	mov    %eax,0xc(%esp)
     873:	31 c0                	xor    %eax,%eax
     875:	89 44 24 08          	mov    %eax,0x8(%esp)
     879:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     87d:	89 34 24             	mov    %esi,(%esp)
     880:	e8 eb fd ff ff       	call   670 <gettoken>
    if(gettoken(ps, es, &q, &eq) != 'a')
     885:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     889:	89 34 24             	mov    %esi,(%esp)
    tok = gettoken(ps, es, 0, 0);
     88c:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     88e:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     891:	89 44 24 0c          	mov    %eax,0xc(%esp)
     895:	8d 45 e0             	lea    -0x20(%ebp),%eax
     898:	89 44 24 08          	mov    %eax,0x8(%esp)
     89c:	e8 cf fd ff ff       	call   670 <gettoken>
     8a1:	83 f8 61             	cmp    $0x61,%eax
     8a4:	75 65                	jne    90b <parseredirs+0xcb>
      panic("missing file for redirection");
    switch(tok){
     8a6:	83 ff 3c             	cmp    $0x3c,%edi
     8a9:	74 45                	je     8f0 <parseredirs+0xb0>
     8ab:	83 ff 3e             	cmp    $0x3e,%edi
     8ae:	66 90                	xchg   %ax,%ax
     8b0:	74 05                	je     8b7 <parseredirs+0x77>
     8b2:	83 ff 2b             	cmp    $0x2b,%edi
     8b5:	75 99                	jne    850 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     8b7:	ba 01 00 00 00       	mov    $0x1,%edx
     8bc:	b9 01 02 00 00       	mov    $0x201,%ecx
     8c1:	89 54 24 10          	mov    %edx,0x10(%esp)
     8c5:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
     8c9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     8cc:	89 44 24 08          	mov    %eax,0x8(%esp)
     8d0:	8b 45 e0             	mov    -0x20(%ebp),%eax
     8d3:	89 44 24 04          	mov    %eax,0x4(%esp)
     8d7:	8b 45 08             	mov    0x8(%ebp),%eax
     8da:	89 04 24             	mov    %eax,(%esp)
     8dd:	e8 4e fc ff ff       	call   530 <redircmd>
     8e2:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     8e5:	e9 66 ff ff ff       	jmp    850 <parseredirs+0x10>
     8ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     8f0:	31 ff                	xor    %edi,%edi
     8f2:	31 c0                	xor    %eax,%eax
     8f4:	89 7c 24 10          	mov    %edi,0x10(%esp)
     8f8:	89 44 24 0c          	mov    %eax,0xc(%esp)
     8fc:	eb cb                	jmp    8c9 <parseredirs+0x89>
     8fe:	66 90                	xchg   %ax,%ax
    }
  }
  return cmd;
}
     900:	8b 45 08             	mov    0x8(%ebp),%eax
     903:	83 c4 3c             	add    $0x3c,%esp
     906:	5b                   	pop    %ebx
     907:	5e                   	pop    %esi
     908:	5f                   	pop    %edi
     909:	5d                   	pop    %ebp
     90a:	c3                   	ret    
      panic("missing file for redirection");
     90b:	c7 04 24 a2 14 00 00 	movl   $0x14a2,(%esp)
     912:	e8 a9 f8 ff ff       	call   1c0 <panic>
     917:	89 f6                	mov    %esi,%esi
     919:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000920 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     920:	55                   	push   %ebp
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     921:	ba c2 14 00 00       	mov    $0x14c2,%edx
{
     926:	89 e5                	mov    %esp,%ebp
     928:	57                   	push   %edi
     929:	56                   	push   %esi
     92a:	53                   	push   %ebx
     92b:	83 ec 3c             	sub    $0x3c,%esp
     92e:	8b 75 08             	mov    0x8(%ebp),%esi
     931:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(peek(ps, es, "("))
     934:	89 54 24 08          	mov    %edx,0x8(%esp)
     938:	89 34 24             	mov    %esi,(%esp)
     93b:	89 7c 24 04          	mov    %edi,0x4(%esp)
     93f:	e8 8c fe ff ff       	call   7d0 <peek>
     944:	85 c0                	test   %eax,%eax
     946:	0f 85 9c 00 00 00    	jne    9e8 <parseexec+0xc8>
     94c:	89 c3                	mov    %eax,%ebx
    return parseblock(ps, es);

  ret = execcmd();
     94e:	e8 9d fb ff ff       	call   4f0 <execcmd>
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     953:	89 7c 24 08          	mov    %edi,0x8(%esp)
     957:	89 74 24 04          	mov    %esi,0x4(%esp)
     95b:	89 04 24             	mov    %eax,(%esp)
  ret = execcmd();
     95e:	89 45 d0             	mov    %eax,-0x30(%ebp)
  ret = parseredirs(ret, ps, es);
     961:	e8 da fe ff ff       	call   840 <parseredirs>
     966:	89 45 d4             	mov    %eax,-0x2c(%ebp)
     969:	eb 1b                	jmp    986 <parseexec+0x66>
     96b:	90                   	nop
     96c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     970:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     973:	89 7c 24 08          	mov    %edi,0x8(%esp)
     977:	89 74 24 04          	mov    %esi,0x4(%esp)
     97b:	89 04 24             	mov    %eax,(%esp)
     97e:	e8 bd fe ff ff       	call   840 <parseredirs>
     983:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     986:	b8 d9 14 00 00       	mov    $0x14d9,%eax
     98b:	89 44 24 08          	mov    %eax,0x8(%esp)
     98f:	89 7c 24 04          	mov    %edi,0x4(%esp)
     993:	89 34 24             	mov    %esi,(%esp)
     996:	e8 35 fe ff ff       	call   7d0 <peek>
     99b:	85 c0                	test   %eax,%eax
     99d:	75 69                	jne    a08 <parseexec+0xe8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     99f:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     9a2:	89 44 24 0c          	mov    %eax,0xc(%esp)
     9a6:	8d 45 e0             	lea    -0x20(%ebp),%eax
     9a9:	89 44 24 08          	mov    %eax,0x8(%esp)
     9ad:	89 7c 24 04          	mov    %edi,0x4(%esp)
     9b1:	89 34 24             	mov    %esi,(%esp)
     9b4:	e8 b7 fc ff ff       	call   670 <gettoken>
     9b9:	85 c0                	test   %eax,%eax
     9bb:	74 4b                	je     a08 <parseexec+0xe8>
    if(tok != 'a')
     9bd:	83 f8 61             	cmp    $0x61,%eax
     9c0:	75 65                	jne    a27 <parseexec+0x107>
    cmd->argv[argc] = q;
     9c2:	8b 45 e0             	mov    -0x20(%ebp),%eax
     9c5:	8b 55 d0             	mov    -0x30(%ebp),%edx
     9c8:	89 44 9a 04          	mov    %eax,0x4(%edx,%ebx,4)
    cmd->eargv[argc] = eq;
     9cc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     9cf:	89 44 9a 2c          	mov    %eax,0x2c(%edx,%ebx,4)
    argc++;
     9d3:	43                   	inc    %ebx
    if(argc >= MAXARGS)
     9d4:	83 fb 0a             	cmp    $0xa,%ebx
     9d7:	75 97                	jne    970 <parseexec+0x50>
      panic("too many args");
     9d9:	c7 04 24 cb 14 00 00 	movl   $0x14cb,(%esp)
     9e0:	e8 db f7 ff ff       	call   1c0 <panic>
     9e5:	8d 76 00             	lea    0x0(%esi),%esi
    return parseblock(ps, es);
     9e8:	89 7c 24 04          	mov    %edi,0x4(%esp)
     9ec:	89 34 24             	mov    %esi,(%esp)
     9ef:	e8 9c 01 00 00       	call   b90 <parseblock>
     9f4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     9f7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     9fa:	83 c4 3c             	add    $0x3c,%esp
     9fd:	5b                   	pop    %ebx
     9fe:	5e                   	pop    %esi
     9ff:	5f                   	pop    %edi
     a00:	5d                   	pop    %ebp
     a01:	c3                   	ret    
     a02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     a08:	8b 45 d0             	mov    -0x30(%ebp),%eax
     a0b:	8d 04 98             	lea    (%eax,%ebx,4),%eax
  cmd->argv[argc] = 0;
     a0e:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  cmd->eargv[argc] = 0;
     a15:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
}
     a1c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     a1f:	83 c4 3c             	add    $0x3c,%esp
     a22:	5b                   	pop    %ebx
     a23:	5e                   	pop    %esi
     a24:	5f                   	pop    %edi
     a25:	5d                   	pop    %ebp
     a26:	c3                   	ret    
      panic("syntax");
     a27:	c7 04 24 c4 14 00 00 	movl   $0x14c4,(%esp)
     a2e:	e8 8d f7 ff ff       	call   1c0 <panic>
     a33:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     a39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a40 <parsepipe>:
{
     a40:	55                   	push   %ebp
     a41:	89 e5                	mov    %esp,%ebp
     a43:	83 ec 28             	sub    $0x28,%esp
     a46:	89 5d f4             	mov    %ebx,-0xc(%ebp)
     a49:	8b 5d 08             	mov    0x8(%ebp),%ebx
     a4c:	89 75 f8             	mov    %esi,-0x8(%ebp)
     a4f:	8b 75 0c             	mov    0xc(%ebp),%esi
     a52:	89 7d fc             	mov    %edi,-0x4(%ebp)
  cmd = parseexec(ps, es);
     a55:	89 1c 24             	mov    %ebx,(%esp)
     a58:	89 74 24 04          	mov    %esi,0x4(%esp)
     a5c:	e8 bf fe ff ff       	call   920 <parseexec>
  if(peek(ps, es, "|")){
     a61:	b9 de 14 00 00       	mov    $0x14de,%ecx
     a66:	89 4c 24 08          	mov    %ecx,0x8(%esp)
     a6a:	89 74 24 04          	mov    %esi,0x4(%esp)
     a6e:	89 1c 24             	mov    %ebx,(%esp)
  cmd = parseexec(ps, es);
     a71:	89 c7                	mov    %eax,%edi
  if(peek(ps, es, "|")){
     a73:	e8 58 fd ff ff       	call   7d0 <peek>
     a78:	85 c0                	test   %eax,%eax
     a7a:	75 14                	jne    a90 <parsepipe+0x50>
}
     a7c:	89 f8                	mov    %edi,%eax
     a7e:	8b 5d f4             	mov    -0xc(%ebp),%ebx
     a81:	8b 75 f8             	mov    -0x8(%ebp),%esi
     a84:	8b 7d fc             	mov    -0x4(%ebp),%edi
     a87:	89 ec                	mov    %ebp,%esp
     a89:	5d                   	pop    %ebp
     a8a:	c3                   	ret    
     a8b:	90                   	nop
     a8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    gettoken(ps, es, 0, 0);
     a90:	31 d2                	xor    %edx,%edx
     a92:	31 c0                	xor    %eax,%eax
     a94:	89 54 24 08          	mov    %edx,0x8(%esp)
     a98:	89 74 24 04          	mov    %esi,0x4(%esp)
     a9c:	89 1c 24             	mov    %ebx,(%esp)
     a9f:	89 44 24 0c          	mov    %eax,0xc(%esp)
     aa3:	e8 c8 fb ff ff       	call   670 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     aa8:	89 74 24 04          	mov    %esi,0x4(%esp)
     aac:	89 1c 24             	mov    %ebx,(%esp)
     aaf:	e8 8c ff ff ff       	call   a40 <parsepipe>
}
     ab4:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    cmd = pipecmd(cmd, parsepipe(ps, es));
     ab7:	89 7d 08             	mov    %edi,0x8(%ebp)
}
     aba:	8b 75 f8             	mov    -0x8(%ebp),%esi
     abd:	8b 7d fc             	mov    -0x4(%ebp),%edi
    cmd = pipecmd(cmd, parsepipe(ps, es));
     ac0:	89 45 0c             	mov    %eax,0xc(%ebp)
}
     ac3:	89 ec                	mov    %ebp,%esp
     ac5:	5d                   	pop    %ebp
    cmd = pipecmd(cmd, parsepipe(ps, es));
     ac6:	e9 c5 fa ff ff       	jmp    590 <pipecmd>
     acb:	90                   	nop
     acc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000ad0 <parseline>:
{
     ad0:	55                   	push   %ebp
     ad1:	89 e5                	mov    %esp,%ebp
     ad3:	57                   	push   %edi
     ad4:	56                   	push   %esi
     ad5:	53                   	push   %ebx
     ad6:	83 ec 1c             	sub    $0x1c,%esp
     ad9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     adc:	8b 75 0c             	mov    0xc(%ebp),%esi
  cmd = parsepipe(ps, es);
     adf:	89 1c 24             	mov    %ebx,(%esp)
     ae2:	89 74 24 04          	mov    %esi,0x4(%esp)
     ae6:	e8 55 ff ff ff       	call   a40 <parsepipe>
     aeb:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
     aed:	eb 23                	jmp    b12 <parseline+0x42>
     aef:	90                   	nop
    gettoken(ps, es, 0, 0);
     af0:	31 c0                	xor    %eax,%eax
     af2:	89 44 24 0c          	mov    %eax,0xc(%esp)
     af6:	31 c0                	xor    %eax,%eax
     af8:	89 44 24 08          	mov    %eax,0x8(%esp)
     afc:	89 74 24 04          	mov    %esi,0x4(%esp)
     b00:	89 1c 24             	mov    %ebx,(%esp)
     b03:	e8 68 fb ff ff       	call   670 <gettoken>
    cmd = backcmd(cmd);
     b08:	89 3c 24             	mov    %edi,(%esp)
     b0b:	e8 20 fb ff ff       	call   630 <backcmd>
     b10:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
     b12:	b8 e0 14 00 00       	mov    $0x14e0,%eax
     b17:	89 44 24 08          	mov    %eax,0x8(%esp)
     b1b:	89 74 24 04          	mov    %esi,0x4(%esp)
     b1f:	89 1c 24             	mov    %ebx,(%esp)
     b22:	e8 a9 fc ff ff       	call   7d0 <peek>
     b27:	85 c0                	test   %eax,%eax
     b29:	75 c5                	jne    af0 <parseline+0x20>
  if(peek(ps, es, ";")){
     b2b:	b9 dc 14 00 00       	mov    $0x14dc,%ecx
     b30:	89 4c 24 08          	mov    %ecx,0x8(%esp)
     b34:	89 74 24 04          	mov    %esi,0x4(%esp)
     b38:	89 1c 24             	mov    %ebx,(%esp)
     b3b:	e8 90 fc ff ff       	call   7d0 <peek>
     b40:	85 c0                	test   %eax,%eax
     b42:	75 0c                	jne    b50 <parseline+0x80>
}
     b44:	83 c4 1c             	add    $0x1c,%esp
     b47:	89 f8                	mov    %edi,%eax
     b49:	5b                   	pop    %ebx
     b4a:	5e                   	pop    %esi
     b4b:	5f                   	pop    %edi
     b4c:	5d                   	pop    %ebp
     b4d:	c3                   	ret    
     b4e:	66 90                	xchg   %ax,%ax
    gettoken(ps, es, 0, 0);
     b50:	31 d2                	xor    %edx,%edx
     b52:	31 c0                	xor    %eax,%eax
     b54:	89 54 24 08          	mov    %edx,0x8(%esp)
     b58:	89 74 24 04          	mov    %esi,0x4(%esp)
     b5c:	89 1c 24             	mov    %ebx,(%esp)
     b5f:	89 44 24 0c          	mov    %eax,0xc(%esp)
     b63:	e8 08 fb ff ff       	call   670 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     b68:	89 74 24 04          	mov    %esi,0x4(%esp)
     b6c:	89 1c 24             	mov    %ebx,(%esp)
     b6f:	e8 5c ff ff ff       	call   ad0 <parseline>
     b74:	89 7d 08             	mov    %edi,0x8(%ebp)
     b77:	89 45 0c             	mov    %eax,0xc(%ebp)
}
     b7a:	83 c4 1c             	add    $0x1c,%esp
     b7d:	5b                   	pop    %ebx
     b7e:	5e                   	pop    %esi
     b7f:	5f                   	pop    %edi
     b80:	5d                   	pop    %ebp
    cmd = listcmd(cmd, parseline(ps, es));
     b81:	e9 5a fa ff ff       	jmp    5e0 <listcmd>
     b86:	8d 76 00             	lea    0x0(%esi),%esi
     b89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b90 <parseblock>:
{
     b90:	55                   	push   %ebp
  if(!peek(ps, es, "("))
     b91:	b8 c2 14 00 00       	mov    $0x14c2,%eax
{
     b96:	89 e5                	mov    %esp,%ebp
     b98:	83 ec 28             	sub    $0x28,%esp
     b9b:	89 5d f4             	mov    %ebx,-0xc(%ebp)
     b9e:	8b 5d 08             	mov    0x8(%ebp),%ebx
     ba1:	89 75 f8             	mov    %esi,-0x8(%ebp)
     ba4:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
     ba7:	89 44 24 08          	mov    %eax,0x8(%esp)
{
     bab:	89 7d fc             	mov    %edi,-0x4(%ebp)
  if(!peek(ps, es, "("))
     bae:	89 1c 24             	mov    %ebx,(%esp)
     bb1:	89 74 24 04          	mov    %esi,0x4(%esp)
     bb5:	e8 16 fc ff ff       	call   7d0 <peek>
     bba:	85 c0                	test   %eax,%eax
     bbc:	74 74                	je     c32 <parseblock+0xa2>
  gettoken(ps, es, 0, 0);
     bbe:	31 c9                	xor    %ecx,%ecx
     bc0:	31 ff                	xor    %edi,%edi
     bc2:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
     bc6:	89 7c 24 08          	mov    %edi,0x8(%esp)
     bca:	89 74 24 04          	mov    %esi,0x4(%esp)
     bce:	89 1c 24             	mov    %ebx,(%esp)
     bd1:	e8 9a fa ff ff       	call   670 <gettoken>
  cmd = parseline(ps, es);
     bd6:	89 74 24 04          	mov    %esi,0x4(%esp)
     bda:	89 1c 24             	mov    %ebx,(%esp)
     bdd:	e8 ee fe ff ff       	call   ad0 <parseline>
  if(!peek(ps, es, ")"))
     be2:	89 74 24 04          	mov    %esi,0x4(%esp)
     be6:	89 1c 24             	mov    %ebx,(%esp)
  cmd = parseline(ps, es);
     be9:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     beb:	b8 fe 14 00 00       	mov    $0x14fe,%eax
     bf0:	89 44 24 08          	mov    %eax,0x8(%esp)
     bf4:	e8 d7 fb ff ff       	call   7d0 <peek>
     bf9:	85 c0                	test   %eax,%eax
     bfb:	74 41                	je     c3e <parseblock+0xae>
  gettoken(ps, es, 0, 0);
     bfd:	31 d2                	xor    %edx,%edx
     bff:	31 c0                	xor    %eax,%eax
     c01:	89 54 24 08          	mov    %edx,0x8(%esp)
     c05:	89 74 24 04          	mov    %esi,0x4(%esp)
     c09:	89 1c 24             	mov    %ebx,(%esp)
     c0c:	89 44 24 0c          	mov    %eax,0xc(%esp)
     c10:	e8 5b fa ff ff       	call   670 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     c15:	89 74 24 08          	mov    %esi,0x8(%esp)
     c19:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     c1d:	89 3c 24             	mov    %edi,(%esp)
     c20:	e8 1b fc ff ff       	call   840 <parseredirs>
}
     c25:	8b 5d f4             	mov    -0xc(%ebp),%ebx
     c28:	8b 75 f8             	mov    -0x8(%ebp),%esi
     c2b:	8b 7d fc             	mov    -0x4(%ebp),%edi
     c2e:	89 ec                	mov    %ebp,%esp
     c30:	5d                   	pop    %ebp
     c31:	c3                   	ret    
    panic("parseblock");
     c32:	c7 04 24 e2 14 00 00 	movl   $0x14e2,(%esp)
     c39:	e8 82 f5 ff ff       	call   1c0 <panic>
    panic("syntax - missing )");
     c3e:	c7 04 24 ed 14 00 00 	movl   $0x14ed,(%esp)
     c45:	e8 76 f5 ff ff       	call   1c0 <panic>
     c4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000c50 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     c50:	55                   	push   %ebp
     c51:	89 e5                	mov    %esp,%ebp
     c53:	53                   	push   %ebx
     c54:	83 ec 14             	sub    $0x14,%esp
     c57:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  
  if(cmd == 0)
     c5a:	85 db                	test   %ebx,%ebx
     c5c:	74 1d                	je     c7b <nulterminate+0x2b>
    return 0;

  switch(cmd->type){
     c5e:	83 3b 05             	cmpl   $0x5,(%ebx)
     c61:	77 18                	ja     c7b <nulterminate+0x2b>
     c63:	8b 03                	mov    (%ebx),%eax
     c65:	ff 24 85 50 15 00 00 	jmp    *0x1550(,%eax,4)
     c6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    nulterminate(lcmd->right);
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
     c70:	8b 43 04             	mov    0x4(%ebx),%eax
     c73:	89 04 24             	mov    %eax,(%esp)
     c76:	e8 d5 ff ff ff       	call   c50 <nulterminate>
    break;
  }
  return cmd;
}
     c7b:	83 c4 14             	add    $0x14,%esp
     c7e:	89 d8                	mov    %ebx,%eax
     c80:	5b                   	pop    %ebx
     c81:	5d                   	pop    %ebp
     c82:	c3                   	ret    
     c83:	90                   	nop
     c84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    nulterminate(lcmd->left);
     c88:	8b 43 04             	mov    0x4(%ebx),%eax
     c8b:	89 04 24             	mov    %eax,(%esp)
     c8e:	e8 bd ff ff ff       	call   c50 <nulterminate>
    nulterminate(lcmd->right);
     c93:	8b 43 08             	mov    0x8(%ebx),%eax
     c96:	89 04 24             	mov    %eax,(%esp)
     c99:	e8 b2 ff ff ff       	call   c50 <nulterminate>
}
     c9e:	83 c4 14             	add    $0x14,%esp
     ca1:	89 d8                	mov    %ebx,%eax
     ca3:	5b                   	pop    %ebx
     ca4:	5d                   	pop    %ebp
     ca5:	c3                   	ret    
     ca6:	8d 76 00             	lea    0x0(%esi),%esi
     ca9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    for(i=0; ecmd->argv[i]; i++)
     cb0:	8b 4b 04             	mov    0x4(%ebx),%ecx
     cb3:	8d 43 08             	lea    0x8(%ebx),%eax
     cb6:	85 c9                	test   %ecx,%ecx
     cb8:	74 c1                	je     c7b <nulterminate+0x2b>
     cba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
     cc0:	8b 50 24             	mov    0x24(%eax),%edx
     cc3:	83 c0 04             	add    $0x4,%eax
     cc6:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
     cc9:	8b 50 fc             	mov    -0x4(%eax),%edx
     ccc:	85 d2                	test   %edx,%edx
     cce:	75 f0                	jne    cc0 <nulterminate+0x70>
}
     cd0:	83 c4 14             	add    $0x14,%esp
     cd3:	89 d8                	mov    %ebx,%eax
     cd5:	5b                   	pop    %ebx
     cd6:	5d                   	pop    %ebp
     cd7:	c3                   	ret    
     cd8:	90                   	nop
     cd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    nulterminate(rcmd->cmd);
     ce0:	8b 43 04             	mov    0x4(%ebx),%eax
     ce3:	89 04 24             	mov    %eax,(%esp)
     ce6:	e8 65 ff ff ff       	call   c50 <nulterminate>
    *rcmd->efile = 0;
     ceb:	8b 43 0c             	mov    0xc(%ebx),%eax
     cee:	c6 00 00             	movb   $0x0,(%eax)
}
     cf1:	83 c4 14             	add    $0x14,%esp
     cf4:	89 d8                	mov    %ebx,%eax
     cf6:	5b                   	pop    %ebx
     cf7:	5d                   	pop    %ebp
     cf8:	c3                   	ret    
     cf9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000d00 <parsecmd>:
{
     d00:	55                   	push   %ebp
     d01:	89 e5                	mov    %esp,%ebp
     d03:	56                   	push   %esi
     d04:	53                   	push   %ebx
     d05:	83 ec 10             	sub    $0x10,%esp
  es = s + strlen(s);
     d08:	8b 5d 08             	mov    0x8(%ebp),%ebx
     d0b:	89 1c 24             	mov    %ebx,(%esp)
     d0e:	e8 cd 00 00 00       	call   de0 <strlen>
     d13:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     d15:	8d 45 08             	lea    0x8(%ebp),%eax
     d18:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     d1c:	89 04 24             	mov    %eax,(%esp)
     d1f:	e8 ac fd ff ff       	call   ad0 <parseline>
  peek(&s, es, "");
     d24:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  cmd = parseline(&s, es);
     d28:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     d2a:	b8 87 14 00 00       	mov    $0x1487,%eax
     d2f:	89 44 24 08          	mov    %eax,0x8(%esp)
     d33:	8d 45 08             	lea    0x8(%ebp),%eax
     d36:	89 04 24             	mov    %eax,(%esp)
     d39:	e8 92 fa ff ff       	call   7d0 <peek>
  if(s != es){
     d3e:	8b 45 08             	mov    0x8(%ebp),%eax
     d41:	39 d8                	cmp    %ebx,%eax
     d43:	75 11                	jne    d56 <parsecmd+0x56>
  nulterminate(cmd);
     d45:	89 34 24             	mov    %esi,(%esp)
     d48:	e8 03 ff ff ff       	call   c50 <nulterminate>
}
     d4d:	83 c4 10             	add    $0x10,%esp
     d50:	89 f0                	mov    %esi,%eax
     d52:	5b                   	pop    %ebx
     d53:	5e                   	pop    %esi
     d54:	5d                   	pop    %ebp
     d55:	c3                   	ret    
    printf(2, "leftovers: %s\n", s);
     d56:	89 44 24 08          	mov    %eax,0x8(%esp)
     d5a:	c7 44 24 04 00 15 00 	movl   $0x1500,0x4(%esp)
     d61:	00 
     d62:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     d69:	e8 82 03 00 00       	call   10f0 <printf>
    panic("syntax");
     d6e:	c7 04 24 c4 14 00 00 	movl   $0x14c4,(%esp)
     d75:	e8 46 f4 ff ff       	call   1c0 <panic>
     d7a:	66 90                	xchg   %ax,%ax
     d7c:	66 90                	xchg   %ax,%ax
     d7e:	66 90                	xchg   %ax,%ax

00000d80 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
     d80:	55                   	push   %ebp
     d81:	89 e5                	mov    %esp,%ebp
     d83:	8b 45 08             	mov    0x8(%ebp),%eax
     d86:	8b 4d 0c             	mov    0xc(%ebp),%ecx
     d89:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     d8a:	89 c2                	mov    %eax,%edx
     d8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     d90:	41                   	inc    %ecx
     d91:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
     d95:	42                   	inc    %edx
     d96:	84 db                	test   %bl,%bl
     d98:	88 5a ff             	mov    %bl,-0x1(%edx)
     d9b:	75 f3                	jne    d90 <strcpy+0x10>
    ;
  return os;
}
     d9d:	5b                   	pop    %ebx
     d9e:	5d                   	pop    %ebp
     d9f:	c3                   	ret    

00000da0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     da0:	55                   	push   %ebp
     da1:	89 e5                	mov    %esp,%ebp
     da3:	8b 4d 08             	mov    0x8(%ebp),%ecx
     da6:	53                   	push   %ebx
     da7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while(*p && *p == *q)
     daa:	0f b6 01             	movzbl (%ecx),%eax
     dad:	0f b6 13             	movzbl (%ebx),%edx
     db0:	84 c0                	test   %al,%al
     db2:	75 18                	jne    dcc <strcmp+0x2c>
     db4:	eb 22                	jmp    dd8 <strcmp+0x38>
     db6:	8d 76 00             	lea    0x0(%esi),%esi
     db9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
     dc0:	41                   	inc    %ecx
  while(*p && *p == *q)
     dc1:	0f b6 01             	movzbl (%ecx),%eax
    p++, q++;
     dc4:	43                   	inc    %ebx
     dc5:	0f b6 13             	movzbl (%ebx),%edx
  while(*p && *p == *q)
     dc8:	84 c0                	test   %al,%al
     dca:	74 0c                	je     dd8 <strcmp+0x38>
     dcc:	38 d0                	cmp    %dl,%al
     dce:	74 f0                	je     dc0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
}
     dd0:	5b                   	pop    %ebx
  return (uchar)*p - (uchar)*q;
     dd1:	29 d0                	sub    %edx,%eax
}
     dd3:	5d                   	pop    %ebp
     dd4:	c3                   	ret    
     dd5:	8d 76 00             	lea    0x0(%esi),%esi
     dd8:	5b                   	pop    %ebx
     dd9:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
     ddb:	29 d0                	sub    %edx,%eax
}
     ddd:	5d                   	pop    %ebp
     dde:	c3                   	ret    
     ddf:	90                   	nop

00000de0 <strlen>:

uint
strlen(const char *s)
{
     de0:	55                   	push   %ebp
     de1:	89 e5                	mov    %esp,%ebp
     de3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     de6:	80 39 00             	cmpb   $0x0,(%ecx)
     de9:	74 15                	je     e00 <strlen+0x20>
     deb:	31 d2                	xor    %edx,%edx
     ded:	8d 76 00             	lea    0x0(%esi),%esi
     df0:	42                   	inc    %edx
     df1:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     df5:	89 d0                	mov    %edx,%eax
     df7:	75 f7                	jne    df0 <strlen+0x10>
    ;
  return n;
}
     df9:	5d                   	pop    %ebp
     dfa:	c3                   	ret    
     dfb:	90                   	nop
     dfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(n = 0; s[n]; n++)
     e00:	31 c0                	xor    %eax,%eax
}
     e02:	5d                   	pop    %ebp
     e03:	c3                   	ret    
     e04:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     e0a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000e10 <memset>:

void*
memset(void *dst, int c, uint n)
{
     e10:	55                   	push   %ebp
     e11:	89 e5                	mov    %esp,%ebp
     e13:	8b 55 08             	mov    0x8(%ebp),%edx
     e16:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     e17:	8b 4d 10             	mov    0x10(%ebp),%ecx
     e1a:	8b 45 0c             	mov    0xc(%ebp),%eax
     e1d:	89 d7                	mov    %edx,%edi
     e1f:	fc                   	cld    
     e20:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     e22:	5f                   	pop    %edi
     e23:	89 d0                	mov    %edx,%eax
     e25:	5d                   	pop    %ebp
     e26:	c3                   	ret    
     e27:	89 f6                	mov    %esi,%esi
     e29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000e30 <strchr>:

char*
strchr(const char *s, char c)
{
     e30:	55                   	push   %ebp
     e31:	89 e5                	mov    %esp,%ebp
     e33:	8b 45 08             	mov    0x8(%ebp),%eax
     e36:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     e3a:	0f b6 10             	movzbl (%eax),%edx
     e3d:	84 d2                	test   %dl,%dl
     e3f:	74 1b                	je     e5c <strchr+0x2c>
    if(*s == c)
     e41:	38 d1                	cmp    %dl,%cl
     e43:	75 0f                	jne    e54 <strchr+0x24>
     e45:	eb 17                	jmp    e5e <strchr+0x2e>
     e47:	89 f6                	mov    %esi,%esi
     e49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     e50:	38 ca                	cmp    %cl,%dl
     e52:	74 0a                	je     e5e <strchr+0x2e>
  for(; *s; s++)
     e54:	40                   	inc    %eax
     e55:	0f b6 10             	movzbl (%eax),%edx
     e58:	84 d2                	test   %dl,%dl
     e5a:	75 f4                	jne    e50 <strchr+0x20>
      return (char*)s;
  return 0;
     e5c:	31 c0                	xor    %eax,%eax
}
     e5e:	5d                   	pop    %ebp
     e5f:	c3                   	ret    

00000e60 <gets>:

char*
gets(char *buf, int max)
{
     e60:	55                   	push   %ebp
     e61:	89 e5                	mov    %esp,%ebp
     e63:	57                   	push   %edi
     e64:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     e65:	31 f6                	xor    %esi,%esi
{
     e67:	53                   	push   %ebx
     e68:	83 ec 3c             	sub    $0x3c,%esp
     e6b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    cc = read(0, &c, 1);
     e6e:	8d 7d e7             	lea    -0x19(%ebp),%edi
  for(i=0; i+1 < max; ){
     e71:	eb 32                	jmp    ea5 <gets+0x45>
     e73:	90                   	nop
     e74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    cc = read(0, &c, 1);
     e78:	ba 01 00 00 00       	mov    $0x1,%edx
     e7d:	89 54 24 08          	mov    %edx,0x8(%esp)
     e81:	89 7c 24 04          	mov    %edi,0x4(%esp)
     e85:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     e8c:	e8 2f 01 00 00       	call   fc0 <read>
    if(cc < 1)
     e91:	85 c0                	test   %eax,%eax
     e93:	7e 19                	jle    eae <gets+0x4e>
      break;
    buf[i++] = c;
     e95:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     e99:	43                   	inc    %ebx
     e9a:	88 43 ff             	mov    %al,-0x1(%ebx)
    if(c == '\n' || c == '\r')
     e9d:	3c 0a                	cmp    $0xa,%al
     e9f:	74 1f                	je     ec0 <gets+0x60>
     ea1:	3c 0d                	cmp    $0xd,%al
     ea3:	74 1b                	je     ec0 <gets+0x60>
  for(i=0; i+1 < max; ){
     ea5:	46                   	inc    %esi
     ea6:	3b 75 0c             	cmp    0xc(%ebp),%esi
     ea9:	89 5d d4             	mov    %ebx,-0x2c(%ebp)
     eac:	7c ca                	jl     e78 <gets+0x18>
      break;
  }
  buf[i] = '\0';
     eae:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     eb1:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
}
     eb4:	8b 45 08             	mov    0x8(%ebp),%eax
     eb7:	83 c4 3c             	add    $0x3c,%esp
     eba:	5b                   	pop    %ebx
     ebb:	5e                   	pop    %esi
     ebc:	5f                   	pop    %edi
     ebd:	5d                   	pop    %ebp
     ebe:	c3                   	ret    
     ebf:	90                   	nop
     ec0:	8b 45 08             	mov    0x8(%ebp),%eax
     ec3:	01 c6                	add    %eax,%esi
     ec5:	89 75 d4             	mov    %esi,-0x2c(%ebp)
     ec8:	eb e4                	jmp    eae <gets+0x4e>
     eca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000ed0 <stat>:

int
stat(const char *n, struct stat *st)
{
     ed0:	55                   	push   %ebp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     ed1:	31 c0                	xor    %eax,%eax
{
     ed3:	89 e5                	mov    %esp,%ebp
     ed5:	83 ec 18             	sub    $0x18,%esp
  fd = open(n, O_RDONLY);
     ed8:	89 44 24 04          	mov    %eax,0x4(%esp)
     edc:	8b 45 08             	mov    0x8(%ebp),%eax
{
     edf:	89 5d f8             	mov    %ebx,-0x8(%ebp)
     ee2:	89 75 fc             	mov    %esi,-0x4(%ebp)
  fd = open(n, O_RDONLY);
     ee5:	89 04 24             	mov    %eax,(%esp)
     ee8:	e8 fb 00 00 00       	call   fe8 <open>
  if(fd < 0)
     eed:	85 c0                	test   %eax,%eax
     eef:	78 2f                	js     f20 <stat+0x50>
     ef1:	89 c3                	mov    %eax,%ebx
    return -1;
  r = fstat(fd, st);
     ef3:	8b 45 0c             	mov    0xc(%ebp),%eax
     ef6:	89 1c 24             	mov    %ebx,(%esp)
     ef9:	89 44 24 04          	mov    %eax,0x4(%esp)
     efd:	e8 fe 00 00 00       	call   1000 <fstat>
  close(fd);
     f02:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     f05:	89 c6                	mov    %eax,%esi
  close(fd);
     f07:	e8 c4 00 00 00       	call   fd0 <close>
  return r;
}
     f0c:	89 f0                	mov    %esi,%eax
     f0e:	8b 5d f8             	mov    -0x8(%ebp),%ebx
     f11:	8b 75 fc             	mov    -0x4(%ebp),%esi
     f14:	89 ec                	mov    %ebp,%esp
     f16:	5d                   	pop    %ebp
     f17:	c3                   	ret    
     f18:	90                   	nop
     f19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
     f20:	be ff ff ff ff       	mov    $0xffffffff,%esi
     f25:	eb e5                	jmp    f0c <stat+0x3c>
     f27:	89 f6                	mov    %esi,%esi
     f29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000f30 <atoi>:

int
atoi(const char *s)
{
     f30:	55                   	push   %ebp
     f31:	89 e5                	mov    %esp,%ebp
     f33:	8b 4d 08             	mov    0x8(%ebp),%ecx
     f36:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     f37:	0f be 11             	movsbl (%ecx),%edx
     f3a:	88 d0                	mov    %dl,%al
     f3c:	2c 30                	sub    $0x30,%al
     f3e:	3c 09                	cmp    $0x9,%al
  n = 0;
     f40:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
     f45:	77 1e                	ja     f65 <atoi+0x35>
     f47:	89 f6                	mov    %esi,%esi
     f49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
     f50:	41                   	inc    %ecx
     f51:	8d 04 80             	lea    (%eax,%eax,4),%eax
     f54:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
     f58:	0f be 11             	movsbl (%ecx),%edx
     f5b:	88 d3                	mov    %dl,%bl
     f5d:	80 eb 30             	sub    $0x30,%bl
     f60:	80 fb 09             	cmp    $0x9,%bl
     f63:	76 eb                	jbe    f50 <atoi+0x20>
  return n;
}
     f65:	5b                   	pop    %ebx
     f66:	5d                   	pop    %ebp
     f67:	c3                   	ret    
     f68:	90                   	nop
     f69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000f70 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     f70:	55                   	push   %ebp
     f71:	89 e5                	mov    %esp,%ebp
     f73:	56                   	push   %esi
     f74:	8b 45 08             	mov    0x8(%ebp),%eax
     f77:	53                   	push   %ebx
     f78:	8b 5d 10             	mov    0x10(%ebp),%ebx
     f7b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     f7e:	85 db                	test   %ebx,%ebx
     f80:	7e 1a                	jle    f9c <memmove+0x2c>
     f82:	31 d2                	xor    %edx,%edx
     f84:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     f8a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi
    *dst++ = *src++;
     f90:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     f94:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     f97:	42                   	inc    %edx
  while(n-- > 0)
     f98:	39 d3                	cmp    %edx,%ebx
     f9a:	75 f4                	jne    f90 <memmove+0x20>
  return vdst;
}
     f9c:	5b                   	pop    %ebx
     f9d:	5e                   	pop    %esi
     f9e:	5d                   	pop    %ebp
     f9f:	c3                   	ret    

00000fa0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     fa0:	b8 01 00 00 00       	mov    $0x1,%eax
     fa5:	cd 40                	int    $0x40
     fa7:	c3                   	ret    

00000fa8 <exit>:
SYSCALL(exit)
     fa8:	b8 02 00 00 00       	mov    $0x2,%eax
     fad:	cd 40                	int    $0x40
     faf:	c3                   	ret    

00000fb0 <wait>:
SYSCALL(wait)
     fb0:	b8 03 00 00 00       	mov    $0x3,%eax
     fb5:	cd 40                	int    $0x40
     fb7:	c3                   	ret    

00000fb8 <pipe>:
SYSCALL(pipe)
     fb8:	b8 04 00 00 00       	mov    $0x4,%eax
     fbd:	cd 40                	int    $0x40
     fbf:	c3                   	ret    

00000fc0 <read>:
SYSCALL(read)
     fc0:	b8 05 00 00 00       	mov    $0x5,%eax
     fc5:	cd 40                	int    $0x40
     fc7:	c3                   	ret    

00000fc8 <write>:
SYSCALL(write)
     fc8:	b8 10 00 00 00       	mov    $0x10,%eax
     fcd:	cd 40                	int    $0x40
     fcf:	c3                   	ret    

00000fd0 <close>:
SYSCALL(close)
     fd0:	b8 15 00 00 00       	mov    $0x15,%eax
     fd5:	cd 40                	int    $0x40
     fd7:	c3                   	ret    

00000fd8 <kill>:
SYSCALL(kill)
     fd8:	b8 06 00 00 00       	mov    $0x6,%eax
     fdd:	cd 40                	int    $0x40
     fdf:	c3                   	ret    

00000fe0 <exec>:
SYSCALL(exec)
     fe0:	b8 07 00 00 00       	mov    $0x7,%eax
     fe5:	cd 40                	int    $0x40
     fe7:	c3                   	ret    

00000fe8 <open>:
SYSCALL(open)
     fe8:	b8 0f 00 00 00       	mov    $0xf,%eax
     fed:	cd 40                	int    $0x40
     fef:	c3                   	ret    

00000ff0 <mknod>:
SYSCALL(mknod)
     ff0:	b8 11 00 00 00       	mov    $0x11,%eax
     ff5:	cd 40                	int    $0x40
     ff7:	c3                   	ret    

00000ff8 <unlink>:
SYSCALL(unlink)
     ff8:	b8 12 00 00 00       	mov    $0x12,%eax
     ffd:	cd 40                	int    $0x40
     fff:	c3                   	ret    

00001000 <fstat>:
SYSCALL(fstat)
    1000:	b8 08 00 00 00       	mov    $0x8,%eax
    1005:	cd 40                	int    $0x40
    1007:	c3                   	ret    

00001008 <link>:
SYSCALL(link)
    1008:	b8 13 00 00 00       	mov    $0x13,%eax
    100d:	cd 40                	int    $0x40
    100f:	c3                   	ret    

00001010 <mkdir>:
SYSCALL(mkdir)
    1010:	b8 14 00 00 00       	mov    $0x14,%eax
    1015:	cd 40                	int    $0x40
    1017:	c3                   	ret    

00001018 <chdir>:
SYSCALL(chdir)
    1018:	b8 09 00 00 00       	mov    $0x9,%eax
    101d:	cd 40                	int    $0x40
    101f:	c3                   	ret    

00001020 <dup>:
SYSCALL(dup)
    1020:	b8 0a 00 00 00       	mov    $0xa,%eax
    1025:	cd 40                	int    $0x40
    1027:	c3                   	ret    

00001028 <getpid>:
SYSCALL(getpid)
    1028:	b8 0b 00 00 00       	mov    $0xb,%eax
    102d:	cd 40                	int    $0x40
    102f:	c3                   	ret    

00001030 <sbrk>:
SYSCALL(sbrk)
    1030:	b8 0c 00 00 00       	mov    $0xc,%eax
    1035:	cd 40                	int    $0x40
    1037:	c3                   	ret    

00001038 <sleep>:
SYSCALL(sleep)
    1038:	b8 0d 00 00 00       	mov    $0xd,%eax
    103d:	cd 40                	int    $0x40
    103f:	c3                   	ret    

00001040 <uptime>:
SYSCALL(uptime)
    1040:	b8 0e 00 00 00       	mov    $0xe,%eax
    1045:	cd 40                	int    $0x40
    1047:	c3                   	ret    

00001048 <detach>:
SYSCALL(detach)
    1048:	b8 16 00 00 00       	mov    $0x16,%eax
    104d:	cd 40                	int    $0x40
    104f:	c3                   	ret    

00001050 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    1050:	55                   	push   %ebp
    1051:	89 e5                	mov    %esp,%ebp
    1053:	57                   	push   %edi
    1054:	56                   	push   %esi
    1055:	53                   	push   %ebx
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    1056:	89 d3                	mov    %edx,%ebx
    1058:	c1 eb 1f             	shr    $0x1f,%ebx
{
    105b:	83 ec 4c             	sub    $0x4c,%esp
  if(sgn && xx < 0){
    105e:	84 db                	test   %bl,%bl
{
    1060:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1063:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    1065:	74 79                	je     10e0 <printint+0x90>
    1067:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    106b:	74 73                	je     10e0 <printint+0x90>
    neg = 1;
    x = -xx;
    106d:	f7 d8                	neg    %eax
    neg = 1;
    106f:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    1076:	31 f6                	xor    %esi,%esi
    1078:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    107b:	eb 05                	jmp    1082 <printint+0x32>
    107d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    1080:	89 fe                	mov    %edi,%esi
    1082:	31 d2                	xor    %edx,%edx
    1084:	f7 f1                	div    %ecx
    1086:	8d 7e 01             	lea    0x1(%esi),%edi
    1089:	0f b6 92 70 15 00 00 	movzbl 0x1570(%edx),%edx
  }while((x /= base) != 0);
    1090:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    1092:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    1095:	75 e9                	jne    1080 <printint+0x30>
  if(neg)
    1097:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    109a:	85 d2                	test   %edx,%edx
    109c:	74 08                	je     10a6 <printint+0x56>
    buf[i++] = '-';
    109e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    10a3:	8d 7e 02             	lea    0x2(%esi),%edi
    10a6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    10aa:	8b 7d c0             	mov    -0x40(%ebp),%edi
    10ad:	8d 76 00             	lea    0x0(%esi),%esi
    10b0:	0f b6 06             	movzbl (%esi),%eax
    10b3:	4e                   	dec    %esi
  write(fd, &c, 1);
    10b4:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    10b8:	89 3c 24             	mov    %edi,(%esp)
    10bb:	88 45 d7             	mov    %al,-0x29(%ebp)
    10be:	b8 01 00 00 00       	mov    $0x1,%eax
    10c3:	89 44 24 08          	mov    %eax,0x8(%esp)
    10c7:	e8 fc fe ff ff       	call   fc8 <write>

  while(--i >= 0)
    10cc:	39 de                	cmp    %ebx,%esi
    10ce:	75 e0                	jne    10b0 <printint+0x60>
    putc(fd, buf[i]);
}
    10d0:	83 c4 4c             	add    $0x4c,%esp
    10d3:	5b                   	pop    %ebx
    10d4:	5e                   	pop    %esi
    10d5:	5f                   	pop    %edi
    10d6:	5d                   	pop    %ebp
    10d7:	c3                   	ret    
    10d8:	90                   	nop
    10d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    10e0:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    10e7:	eb 8d                	jmp    1076 <printint+0x26>
    10e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000010f0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    10f0:	55                   	push   %ebp
    10f1:	89 e5                	mov    %esp,%ebp
    10f3:	57                   	push   %edi
    10f4:	56                   	push   %esi
    10f5:	53                   	push   %ebx
    10f6:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    10f9:	8b 75 0c             	mov    0xc(%ebp),%esi
    10fc:	0f b6 1e             	movzbl (%esi),%ebx
    10ff:	84 db                	test   %bl,%bl
    1101:	0f 84 d1 00 00 00    	je     11d8 <printf+0xe8>
  state = 0;
    1107:	31 ff                	xor    %edi,%edi
    1109:	46                   	inc    %esi
  ap = (uint*)(void*)&fmt + 1;
    110a:	8d 45 10             	lea    0x10(%ebp),%eax
  write(fd, &c, 1);
    110d:	89 fa                	mov    %edi,%edx
    110f:	8b 7d 08             	mov    0x8(%ebp),%edi
  ap = (uint*)(void*)&fmt + 1;
    1112:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1115:	eb 41                	jmp    1158 <printf+0x68>
    1117:	89 f6                	mov    %esi,%esi
    1119:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1120:	83 f8 25             	cmp    $0x25,%eax
    1123:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    1126:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
    112b:	74 1e                	je     114b <printf+0x5b>
  write(fd, &c, 1);
    112d:	b8 01 00 00 00       	mov    $0x1,%eax
    1132:	89 44 24 08          	mov    %eax,0x8(%esp)
    1136:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1139:	89 44 24 04          	mov    %eax,0x4(%esp)
    113d:	89 3c 24             	mov    %edi,(%esp)
    1140:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    1143:	e8 80 fe ff ff       	call   fc8 <write>
    1148:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    114b:	46                   	inc    %esi
  for(i = 0; fmt[i]; i++){
    114c:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    1150:	84 db                	test   %bl,%bl
    1152:	0f 84 80 00 00 00    	je     11d8 <printf+0xe8>
    if(state == 0){
    1158:	85 d2                	test   %edx,%edx
    c = fmt[i] & 0xff;
    115a:	0f be cb             	movsbl %bl,%ecx
    115d:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    1160:	74 be                	je     1120 <printf+0x30>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    1162:	83 fa 25             	cmp    $0x25,%edx
    1165:	75 e4                	jne    114b <printf+0x5b>
      if(c == 'd'){
    1167:	83 f8 64             	cmp    $0x64,%eax
    116a:	0f 84 f0 00 00 00    	je     1260 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    1170:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    1176:	83 f9 70             	cmp    $0x70,%ecx
    1179:	74 65                	je     11e0 <printf+0xf0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    117b:	83 f8 73             	cmp    $0x73,%eax
    117e:	0f 84 8c 00 00 00    	je     1210 <printf+0x120>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    1184:	83 f8 63             	cmp    $0x63,%eax
    1187:	0f 84 13 01 00 00    	je     12a0 <printf+0x1b0>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    118d:	83 f8 25             	cmp    $0x25,%eax
    1190:	0f 84 e2 00 00 00    	je     1278 <printf+0x188>
  write(fd, &c, 1);
    1196:	b8 01 00 00 00       	mov    $0x1,%eax
    119b:	46                   	inc    %esi
    119c:	89 44 24 08          	mov    %eax,0x8(%esp)
    11a0:	8d 45 e7             	lea    -0x19(%ebp),%eax
    11a3:	89 44 24 04          	mov    %eax,0x4(%esp)
    11a7:	89 3c 24             	mov    %edi,(%esp)
    11aa:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    11ae:	e8 15 fe ff ff       	call   fc8 <write>
    11b3:	ba 01 00 00 00       	mov    $0x1,%edx
    11b8:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    11bb:	89 54 24 08          	mov    %edx,0x8(%esp)
    11bf:	89 44 24 04          	mov    %eax,0x4(%esp)
    11c3:	89 3c 24             	mov    %edi,(%esp)
    11c6:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    11c9:	e8 fa fd ff ff       	call   fc8 <write>
  for(i = 0; fmt[i]; i++){
    11ce:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    11d2:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
    11d4:	84 db                	test   %bl,%bl
    11d6:	75 80                	jne    1158 <printf+0x68>
    }
  }
}
    11d8:	83 c4 3c             	add    $0x3c,%esp
    11db:	5b                   	pop    %ebx
    11dc:	5e                   	pop    %esi
    11dd:	5f                   	pop    %edi
    11de:	5d                   	pop    %ebp
    11df:	c3                   	ret    
        printint(fd, *ap, 16, 0);
    11e0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    11e7:	b9 10 00 00 00       	mov    $0x10,%ecx
    11ec:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    11ef:	89 f8                	mov    %edi,%eax
    11f1:	8b 13                	mov    (%ebx),%edx
    11f3:	e8 58 fe ff ff       	call   1050 <printint>
        ap++;
    11f8:	89 d8                	mov    %ebx,%eax
      state = 0;
    11fa:	31 d2                	xor    %edx,%edx
        ap++;
    11fc:	83 c0 04             	add    $0x4,%eax
    11ff:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1202:	e9 44 ff ff ff       	jmp    114b <printf+0x5b>
    1207:	89 f6                	mov    %esi,%esi
    1209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        s = (char*)*ap;
    1210:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1213:	8b 10                	mov    (%eax),%edx
        ap++;
    1215:	83 c0 04             	add    $0x4,%eax
    1218:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    121b:	85 d2                	test   %edx,%edx
    121d:	0f 84 aa 00 00 00    	je     12cd <printf+0x1dd>
        while(*s != 0){
    1223:	0f b6 02             	movzbl (%edx),%eax
        s = (char*)*ap;
    1226:	89 d3                	mov    %edx,%ebx
        while(*s != 0){
    1228:	84 c0                	test   %al,%al
    122a:	74 27                	je     1253 <printf+0x163>
    122c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1230:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    1233:	b8 01 00 00 00       	mov    $0x1,%eax
          s++;
    1238:	43                   	inc    %ebx
  write(fd, &c, 1);
    1239:	89 44 24 08          	mov    %eax,0x8(%esp)
    123d:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    1240:	89 44 24 04          	mov    %eax,0x4(%esp)
    1244:	89 3c 24             	mov    %edi,(%esp)
    1247:	e8 7c fd ff ff       	call   fc8 <write>
        while(*s != 0){
    124c:	0f b6 03             	movzbl (%ebx),%eax
    124f:	84 c0                	test   %al,%al
    1251:	75 dd                	jne    1230 <printf+0x140>
      state = 0;
    1253:	31 d2                	xor    %edx,%edx
    1255:	e9 f1 fe ff ff       	jmp    114b <printf+0x5b>
    125a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1260:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1267:	b9 0a 00 00 00       	mov    $0xa,%ecx
    126c:	e9 7b ff ff ff       	jmp    11ec <printf+0xfc>
    1271:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  write(fd, &c, 1);
    1278:	b9 01 00 00 00       	mov    $0x1,%ecx
    127d:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1280:	89 4c 24 08          	mov    %ecx,0x8(%esp)
    1284:	89 44 24 04          	mov    %eax,0x4(%esp)
    1288:	89 3c 24             	mov    %edi,(%esp)
    128b:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    128e:	e8 35 fd ff ff       	call   fc8 <write>
      state = 0;
    1293:	31 d2                	xor    %edx,%edx
    1295:	e9 b1 fe ff ff       	jmp    114b <printf+0x5b>
    129a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        putc(fd, *ap);
    12a0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    12a3:	8b 03                	mov    (%ebx),%eax
        ap++;
    12a5:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
    12a8:	89 3c 24             	mov    %edi,(%esp)
        putc(fd, *ap);
    12ab:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    12ae:	b8 01 00 00 00       	mov    $0x1,%eax
    12b3:	89 44 24 08          	mov    %eax,0x8(%esp)
    12b7:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    12ba:	89 44 24 04          	mov    %eax,0x4(%esp)
    12be:	e8 05 fd ff ff       	call   fc8 <write>
      state = 0;
    12c3:	31 d2                	xor    %edx,%edx
        ap++;
    12c5:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    12c8:	e9 7e fe ff ff       	jmp    114b <printf+0x5b>
          s = "(null)";
    12cd:	bb 68 15 00 00       	mov    $0x1568,%ebx
        while(*s != 0){
    12d2:	b0 28                	mov    $0x28,%al
    12d4:	e9 57 ff ff ff       	jmp    1230 <printf+0x140>
    12d9:	66 90                	xchg   %ax,%ax
    12db:	66 90                	xchg   %ax,%ax
    12dd:	66 90                	xchg   %ax,%ax
    12df:	90                   	nop

000012e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    12e0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    12e1:	a1 a4 1b 00 00       	mov    0x1ba4,%eax
{
    12e6:	89 e5                	mov    %esp,%ebp
    12e8:	57                   	push   %edi
    12e9:	56                   	push   %esi
    12ea:	53                   	push   %ebx
    12eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    12ee:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    12f1:	eb 0d                	jmp    1300 <free+0x20>
    12f3:	90                   	nop
    12f4:	90                   	nop
    12f5:	90                   	nop
    12f6:	90                   	nop
    12f7:	90                   	nop
    12f8:	90                   	nop
    12f9:	90                   	nop
    12fa:	90                   	nop
    12fb:	90                   	nop
    12fc:	90                   	nop
    12fd:	90                   	nop
    12fe:	90                   	nop
    12ff:	90                   	nop
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1300:	39 c8                	cmp    %ecx,%eax
    1302:	8b 10                	mov    (%eax),%edx
    1304:	73 32                	jae    1338 <free+0x58>
    1306:	39 d1                	cmp    %edx,%ecx
    1308:	72 04                	jb     130e <free+0x2e>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    130a:	39 d0                	cmp    %edx,%eax
    130c:	72 32                	jb     1340 <free+0x60>
      break;
  if(bp + bp->s.size == p->s.ptr){
    130e:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1311:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    1314:	39 fa                	cmp    %edi,%edx
    1316:	74 30                	je     1348 <free+0x68>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    1318:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    131b:	8b 50 04             	mov    0x4(%eax),%edx
    131e:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1321:	39 f1                	cmp    %esi,%ecx
    1323:	74 3c                	je     1361 <free+0x81>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    1325:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
    1327:	5b                   	pop    %ebx
  freep = p;
    1328:	a3 a4 1b 00 00       	mov    %eax,0x1ba4
}
    132d:	5e                   	pop    %esi
    132e:	5f                   	pop    %edi
    132f:	5d                   	pop    %ebp
    1330:	c3                   	ret    
    1331:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1338:	39 d0                	cmp    %edx,%eax
    133a:	72 04                	jb     1340 <free+0x60>
    133c:	39 d1                	cmp    %edx,%ecx
    133e:	72 ce                	jb     130e <free+0x2e>
{
    1340:	89 d0                	mov    %edx,%eax
    1342:	eb bc                	jmp    1300 <free+0x20>
    1344:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    1348:	8b 7a 04             	mov    0x4(%edx),%edi
    134b:	01 fe                	add    %edi,%esi
    134d:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1350:	8b 10                	mov    (%eax),%edx
    1352:	8b 12                	mov    (%edx),%edx
    1354:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    1357:	8b 50 04             	mov    0x4(%eax),%edx
    135a:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    135d:	39 f1                	cmp    %esi,%ecx
    135f:	75 c4                	jne    1325 <free+0x45>
    p->s.size += bp->s.size;
    1361:	8b 4b fc             	mov    -0x4(%ebx),%ecx
  freep = p;
    1364:	a3 a4 1b 00 00       	mov    %eax,0x1ba4
    p->s.size += bp->s.size;
    1369:	01 ca                	add    %ecx,%edx
    136b:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    136e:	8b 53 f8             	mov    -0x8(%ebx),%edx
    1371:	89 10                	mov    %edx,(%eax)
}
    1373:	5b                   	pop    %ebx
    1374:	5e                   	pop    %esi
    1375:	5f                   	pop    %edi
    1376:	5d                   	pop    %ebp
    1377:	c3                   	ret    
    1378:	90                   	nop
    1379:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001380 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1380:	55                   	push   %ebp
    1381:	89 e5                	mov    %esp,%ebp
    1383:	57                   	push   %edi
    1384:	56                   	push   %esi
    1385:	53                   	push   %ebx
    1386:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1389:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    138c:	8b 15 a4 1b 00 00    	mov    0x1ba4,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1392:	8d 78 07             	lea    0x7(%eax),%edi
    1395:	c1 ef 03             	shr    $0x3,%edi
    1398:	47                   	inc    %edi
  if((prevp = freep) == 0){
    1399:	85 d2                	test   %edx,%edx
    139b:	0f 84 8f 00 00 00    	je     1430 <malloc+0xb0>
    13a1:	8b 02                	mov    (%edx),%eax
    13a3:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    13a6:	39 cf                	cmp    %ecx,%edi
    13a8:	76 66                	jbe    1410 <malloc+0x90>
    13aa:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    13b0:	bb 00 10 00 00       	mov    $0x1000,%ebx
    13b5:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    13b8:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    13bf:	eb 10                	jmp    13d1 <malloc+0x51>
    13c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    13c8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    13ca:	8b 48 04             	mov    0x4(%eax),%ecx
    13cd:	39 f9                	cmp    %edi,%ecx
    13cf:	73 3f                	jae    1410 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    13d1:	39 05 a4 1b 00 00    	cmp    %eax,0x1ba4
    13d7:	89 c2                	mov    %eax,%edx
    13d9:	75 ed                	jne    13c8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    13db:	89 34 24             	mov    %esi,(%esp)
    13de:	e8 4d fc ff ff       	call   1030 <sbrk>
  if(p == (char*)-1)
    13e3:	83 f8 ff             	cmp    $0xffffffff,%eax
    13e6:	74 18                	je     1400 <malloc+0x80>
  hp->s.size = nu;
    13e8:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    13eb:	83 c0 08             	add    $0x8,%eax
    13ee:	89 04 24             	mov    %eax,(%esp)
    13f1:	e8 ea fe ff ff       	call   12e0 <free>
  return freep;
    13f6:	8b 15 a4 1b 00 00    	mov    0x1ba4,%edx
      if((p = morecore(nunits)) == 0)
    13fc:	85 d2                	test   %edx,%edx
    13fe:	75 c8                	jne    13c8 <malloc+0x48>
        return 0;
  }
}
    1400:	83 c4 1c             	add    $0x1c,%esp
        return 0;
    1403:	31 c0                	xor    %eax,%eax
}
    1405:	5b                   	pop    %ebx
    1406:	5e                   	pop    %esi
    1407:	5f                   	pop    %edi
    1408:	5d                   	pop    %ebp
    1409:	c3                   	ret    
    140a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    1410:	39 cf                	cmp    %ecx,%edi
    1412:	74 4c                	je     1460 <malloc+0xe0>
        p->s.size -= nunits;
    1414:	29 f9                	sub    %edi,%ecx
    1416:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1419:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    141c:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    141f:	89 15 a4 1b 00 00    	mov    %edx,0x1ba4
}
    1425:	83 c4 1c             	add    $0x1c,%esp
      return (void*)(p + 1);
    1428:	83 c0 08             	add    $0x8,%eax
}
    142b:	5b                   	pop    %ebx
    142c:	5e                   	pop    %esi
    142d:	5f                   	pop    %edi
    142e:	5d                   	pop    %ebp
    142f:	c3                   	ret    
    base.s.ptr = freep = prevp = &base;
    1430:	b8 a8 1b 00 00       	mov    $0x1ba8,%eax
    1435:	ba a8 1b 00 00       	mov    $0x1ba8,%edx
    base.s.size = 0;
    143a:	31 c9                	xor    %ecx,%ecx
    base.s.ptr = freep = prevp = &base;
    143c:	a3 a4 1b 00 00       	mov    %eax,0x1ba4
    base.s.size = 0;
    1441:	b8 a8 1b 00 00       	mov    $0x1ba8,%eax
    base.s.ptr = freep = prevp = &base;
    1446:	89 15 a8 1b 00 00    	mov    %edx,0x1ba8
    base.s.size = 0;
    144c:	89 0d ac 1b 00 00    	mov    %ecx,0x1bac
    1452:	e9 53 ff ff ff       	jmp    13aa <malloc+0x2a>
    1457:	89 f6                	mov    %esi,%esi
    1459:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        prevp->s.ptr = p->s.ptr;
    1460:	8b 08                	mov    (%eax),%ecx
    1462:	89 0a                	mov    %ecx,(%edx)
    1464:	eb b9                	jmp    141f <malloc+0x9f>
