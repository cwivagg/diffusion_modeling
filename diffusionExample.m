D = 100;
trajectories = diffusionSimulator(D);

figure
hold on
for i = 1:25
    track = trajectories(i,:,:);
    track = reshape(track,[3,size(track,3)]);
    track = track';
    plot3(track(:,1),track(:,2),track(:,3));
end
axis equal