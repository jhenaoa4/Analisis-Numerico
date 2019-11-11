function y=encrypt(str,k,n)
s=complet(codStr(str),n)
b=intoBlocks(s,n);
e=encryBlocks(b,k,n)
y=finPal(toNum(e))
end