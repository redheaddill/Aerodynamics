%Define ISA (sigma)
function s = sigma(alt)
    if alt <= 36089
        s = theta(alt)^4.2621;
    else
        s = 0.297*exp(-(alt-36089)/20790);
    end
end