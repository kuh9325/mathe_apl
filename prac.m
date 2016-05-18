t = -5:0.01:5;
y=1./((t-0.3).^2+0.01)+1./((t-0.9).^2+0.04)-6;
plot(t,y)
set(gca,'xlim',[0 6],'ylim',[-5 20])
set(gca,'xlim',[0 6],'ylim',[-10 100])
set(gca,'xtick',[0:0.2:1 2.5 3 3.5 4 4.5])
set(gca,'xtick',[0:0.3:3 5])
mylabel = str2mat('I','II','III','IV','V','VI','VII','VIII','IX','X','XI','XII');
set(gca,'xticklabel',mylabel)