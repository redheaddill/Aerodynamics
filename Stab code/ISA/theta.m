%Define ISA (theta)
function t = theta(alt)
    if alt <= 36089
        t = 1-(alt/145454);
    else
        t = 0.7519;
    end
end