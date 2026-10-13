if (!variable_global_exists("moneda"))
{
    global.moneda = 0
}

global.moneda += 1;

instance_destroy();