if (!variable_global_exists("monedas"))
{
    global.monedas = 0
}

global.monedas += 1;

instance_destroy();