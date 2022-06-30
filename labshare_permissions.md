## Instructions on checking and modifying folder/file permissions on HPC lab share 

### Checking permissions 

There are two ways to check permissions: 

1. Use NFSv4 ACLs

`$ nfs4_getfacl /PATH/TO/FOLDER/OR/FILE`

Sample output:
```

# file: temp
A:fdg:rc-Szhao@KIEWIT.DARTMOUTH.EDU:rwadxtTnNcy
A::OWNER@:rwadxtTnNcy
A:fdi:OWNER@:rwadxtTnNcy
A:fd:GROUP@:rwaDdxtTnNcCoy
```


2. More human readable (wrapper on NFSv4 ACL) 

`$ listacl -v /PATH/TO/FOLDER/OR/FILE`

Sample output:
```
CWD=/dartfs/rc/lab/S/Szhao/liyang
drwxrwx--- 2 f005d5b rc-Szhao-admin 81 Jun 28 10:58 temp
 A:fdg:rc-Szhao            rwa-dxtTnNc--y Allow            [rc-Szhao]         (Read Write Traverse)
 A::OWNER@                 rwa-dxtTnNc--y Allow           (Liyang Yu)         (Read Write Traverse)
 A:fdi:OWNER@              rwa-dxtTnNc--y Allow       (Creator-Owner)                      (Custom)
 A:fd:GROUP@               rwaDdxtTnNcCoy Allow    ([rc-Szhao-admin]) (Read Write Traverse Control)

```

### Modifying permissions 

From method 1 in 'Checking permissions' above, use the output and make changes to the options to set desired permissions. 

Example: 
We want to remove permission to delete files for lab members except for the owner and remove permission to write files for group members.

```
$ cat << EOF > ~/group_acl.txt
A:fdg:rc-Szhao@KIEWIT.DARTMOUTH.EDU:rwaxtTnNcy
A::OWNER@:rwadxtTnNcy
A:fdi:OWNER@:rwadxtTnNcy
A:fd:GROUP@:raxtTnNcCoy
EOF

$ nfs4_setfacl -R -S ~/group_acl.txt /PATH/TO/FOLDER/OR/FILE
```

Confirm changes:
```
$ listacl -v temp
CWD=/dartfs/rc/lab/S/Szhao/liyang
drwxrwx--- 2 f005d5b rc-Szhao-admin 81 Jun 28 10:58 temp
 A:fdg:rc-Szhao            rwa--xtTnNc--y Allow            [rc-Szhao]         (Read Write Traverse)
 A::OWNER@                 rwa-dxtTnNc--y Allow           (Liyang Yu)         (Read Write Traverse)
 A:fdi:OWNER@              rwa-dxtTnNc--y Allow       (Creator-Owner)                      (Custom)
 A:fd:GROUP@               r-a--xtTnNcCoy Allow    ([rc-Szhao-admin])       (Read Traverse Control)
```

Summary table of the permission options:

<img width="1212" alt="Screen Shot 2022-06-30 at 10 40 17 AM" src="https://user-images.githubusercontent.com/89649165/176705996-9db7b0d8-d69d-4e5f-bf16-fff4d1bb00a4.png">

Source: Dartmouth ITC and [Use NFSv4 ACL](https://www.osc.edu/book/export/html/4523)
