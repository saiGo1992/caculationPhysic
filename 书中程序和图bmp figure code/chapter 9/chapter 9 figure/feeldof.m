function [index]=feeldof(nd,nnel,ndof) 
% 计算与与每个单元联系的系统自由度
% % index - system dof vector associated with element iel 
% nd - element node numbers whose system dofs are to be determined 
% nnel - number of nodes per element 
% ndof - number of dofs per node 
edof = nnel*ndof; 
k=0; 
for i=1:nnel 
start = (nd(i)-1)*ndof; 
for j=1:ndof
k=k+1;
index(k)=start+j; 
end
end
end