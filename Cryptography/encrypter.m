function y=encrypter(str,n,r,k,I)
s=complet(codStr(str),n);
B=intoBlocks(s,n);
e=encryOFB(B,k,n,r,I);
y=finPal(toNum(e));
end