//: Playground - noun: a place where people can play

import UIKit

var tiendien:Int = 1000
var sodiensudung:Int?

sodiensudung = 200
if (sodiensudung <= 50 && sodiensudung > 0)

{
    tiendien = tiendien + sodiensudung! * 230
    
}

if (sodiensudung > 50 && sodiensudung <= 100)
{
    tiendien = tiendien + 50 * 230 + (sodiensudung! - 50) * 480
    print(tiendien)

}

if (sodiensudung > 100 && sodiensudung < 150)
{
    tiendien = tiendien + 50 * 230 + 50 * 480 + (sodiensudung! - 100) * 700
    print(tiendien)

}

else
{
    tiendien = tiendien + 70500 + (sodiensudung! - 150) * 900
    print(tiendien)

}
