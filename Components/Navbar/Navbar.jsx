import React, { useContext, useState } from 'react'
import './Navbar.css'
import logo from '../Assets/logo.png'
import cart_icon from '../Assets/cart_icon.png'
import { Link } from 'react-router-dom'
import { ShopContext } from '../../Context/ShopContext'

const Navbar = () => {

    const[menu,setMenu] = useState("shop");
    const {getTotalCartItems} = useContext(ShopContext);

  return (
    <div className="navbar">
        <div className="nav-logo">
            <img src={logo} alt="" />
            <p>GREENCART</p>
        </div>
        <ul className="nav-menu">
            <li onClick={()=>{setMenu("shop")}}><Link style={{textDecoration: 'none'}} to='/'>Shop</Link>{menu==="shop"?<hr/>:<></>}</li>
            <li onClick={()=>{setMenu("fish_meat")}}><Link style={{textDecoration: 'none'}} to='/fish-meat'>Fish&Meat</Link> {menu==="fish_meat"?<hr/>:<></>}</li>
            <li onClick={()=>{setMenu("fruits_veg")}}><Link style={{textDecoration: 'none'}} to='/fruits-veg'>Fruits&Veg</Link> {menu==="fruits_veg"?<hr/>:<></>}</li>
            <li onClick={()=>{setMenu("beverages")}}><Link style={{textDecoration: 'none'}} to='/beverages'>Beverages</Link> {menu==="beverages"?<hr/>:<></>}</li>
        </ul>
        <div className="nav-login-cart">
            <Link to='/login'><button>Login</button></Link>
            <Link to='/cart'><img src={cart_icon} alt="" /></Link>
            <div className="nav-cart-count">{getTotalCartItems()}</div>
        </div>
    </div>
  )
}

export default Navbar