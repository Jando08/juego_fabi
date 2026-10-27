if (!variable_global_exists("monedas"))
{
    global.monedas = 0
}

if (!global.caido)
{
    global.monedas += 1;
}

instance_destroy();