function y=decrypt(str,k,n)
s=complet(codStr(str),n)
b=intoBlocks(s,n);
d=decryBlocks(b,k,n)
y=finPal(toNum(d))
end