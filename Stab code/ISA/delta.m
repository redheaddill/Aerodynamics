%Define ISA (delta)
function d = delta(alt)
    if alt <= 36089
        d = theta(alt)^5.2621;
    else
        d = 0.223*exp(-(alt-36089)/20790);
    end
end
