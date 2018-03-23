net time \\pop-dc1 /set /yes

net use * /delete:yes

net use /persistent:yes
net use M: \\corp-vs-fs1\MacProjects
net use P: \\corp-vs-fs1\Projects
net use S: \\corp-vs-sft1\software
net use T: \\corp-merlin\depts
net use Y: \\corp-gorgon\software$
net use V: \\corp-vs-fs1\target
net use /persistent:no