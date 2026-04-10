<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>ADTech || Payments Gateway</title>
 <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600;700&display=swap" rel="stylesheet">

<style>
    body {
        font-family: 'Open Sans', sans-serif;
        background: #f2f2f2;
        text-align: center;
        padding-top: 40px;
    }
    
    img {
        width: 100px;
        height: 100px;
    }
    
    h3 {
        color: red;
    }
    
    .box {
        width: 330px;
        margin: auto;
        background: #fff;
        padding: 20px;
        border-radius: 12px;
        box-shadow: 0 0 10px rgba(0,0,0,0.5);
    }
    select, button {
        width: 300px;
        padding: 12px;
        margin: 10px auto;
        font-size: 18px;
        font-family: 'Open Sans';
        border-radius: 8px;
        border: 1px solid darkgreen;
    }
    .qr-box {
        margin-top: 17px;
    }
    .qr-img {
        width: 270px;
        height: 270px;
        border: 2px solid black;
        border-radius: 5px;
        padding: 15px;
    }
    .btn {
        background: #4CAF50;
        color: white;
        cursor: pointer;
      }
    
    .stepper-wrapper {
  margin-top: auto;
  display: flex;
  justify-content: space-between;
  margin-bottom: 20px;
}
.stepper-item {
  position: relative;
  display: flex;
  flex-direction: column;
  align-items: center;
  flex: 1;

  @media (max-width: 768px) {
    font-size: 12px;
  }
}

.stepper-item::before {
  position: absolute;
  content: "";
  border-bottom: 2px solid #ccc;
  width: 100%;
  top: 20px;
  left: -50%;
  z-index: 2;
}

.stepper-item::after {
  position: absolute;
  content: "";
  border-bottom: 2px solid #ccc;
  width: 100%;
  top: 20px;
  left: 50%;
  z-index: 2;
}

.stepper-item .step-counter {
  position: relative;
  z-index: 5;
  display: flex;
  justify-content: center;
  align-items: center;
  width: 40px;
  height: 40px;
  border-radius: 50%;
  background: #ccc;
  margin-bottom: 6px;
}

.stepper-item.active {
  font-weight: bold;
}

.stepper-item.completed .step-counter {
  background-color: #4bb543;
}

.stepper-item.completed::after {
  position: absolute;
  content: "";
  border-bottom: 2px solid #4bb543;
  width: 100%;
  top: 20px;
  left: 50%;
  z-index: 3;
}

.stepper-item:first-child::before {
  content: none;
}
.stepper-item:last-child::after {
  content: none;
}
</style>

<script>
function updatePayment() {
    const plan = document.getElementById("plan").value;
    let amount = 99.00;

    if (plan === "1") amount = 99.00;
    if (plan === "6") amount = 299.00;
    if (plan === "12") amount = 499.00;
    if (plan === "24") amount = 999.00;

    const upiID = "adxmow@axl";
    const tnMessage = "This payment is being deducted for the renewal of your Website Domain. Team - ADTech Inc.";

    const upiLink =
        `upi://pay?pa=${upiID}&pn=Domain%20Renewal&am=${amount}&cu=INR&tn=${encodeURIComponent(tnMessage)}`;

    // Update button
    document.getElementById("payBtn").setAttribute("href", upiLink);

    // Update QR
    const qrURL =
        `https://api.qrserver.com/v1/create-qr-code/?size=270x270&data=${encodeURIComponent(upiLink)}`;

    document.getElementById("qrImg").src = qrURL;

    // Update text
    document.getElementById("amtText").innerHTML = `Payable Amount : ₹${amount}`;
}
</script>

</head>
<body>
    
  <!-- UPI -->
    
<div class="box">
    <img src="data:image/svg+xml;base64,
        PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij48ZyBzdHJva2U9IiNmZjAyMDIiIHN0cm9rZS1saW5lY2FwPSJyb3VuZCIgc3Ryb2tlLWxpbmVqb2luPSJyb3VuZCIgc3Ryb2tlLXdpZHRoPSIyIj48cGF0aCBmaWxsPSIjZmYwMjAyIiBmaWxsLW9wYWNpdHk9IjAiIHN0cm9rZS1kYXNoYXJyYXk9IjYwIiBkPSJNMTIgM2M0Ljk3IDAgOSA0LjAzIDkgOWMwIDQuOTcgLTQuMDMgOSAtOSA5Yy00Ljk3IDAgLTkgLTQuMDMgLTkgLTljMCAtNC45NyA0LjAzIC05IDkgLTlaIj48YW5pbWF0ZSBmaWxsPSJmcmVlemUiIGF0dHJpYnV0ZU5hbWU9InN0cm9rZS1kYXNob2Zmc2V0IiBkdXI9IjAuNnMiIHZhbHVlcz0iNjA7MCIvPjxhbmltYXRlIGZpbGw9ImZyZWV6ZSIgYXR0cmlidXRlTmFtZT0iZmlsbC1vcGFjaXR5IiBiZWdpbj0iMXMiIGR1cj0iMC4xNXMiIHRvPSIwLjMiLz48L3BhdGg+PGcgZmlsbD0ibm9uZSI+PHBhdGggc3Ryb2tlLWRhc2hhcnJheT0iOCIgc3Ryb2tlLWRhc2hvZmZzZXQ9IjgiIGQ9Ik0xMiA3djYiPjxhbmltYXRlIGF0dHJpYnV0ZU5hbWU9InN0cm9rZS13aWR0aCIgYmVnaW49IjAuN3MiIGR1cj0iM3MiIGtleVRpbWVzPSIwOzAuMTswLjI7MC4zOzEiIHJlcGVhdENvdW50PSJpbmRlZmluaXRlIiB2YWx1ZXM9IjI7MzszOzI7MiIvPjxhbmltYXRlIGZpbGw9ImZyZWV6ZSIgYXR0cmlidXRlTmFtZT0ic3Ryb2tlLWRhc2hvZmZzZXQiIGJlZ2luPSIwLjdzIiBkdXI9IjAuMnMiIHRvPSIwIi8+PC9wYXRoPjxwYXRoIHN0cm9rZS1kYXNoYXJyYXk9IjQiIHN0cm9rZS1kYXNob2Zmc2V0PSI0IiBkPSJNMTIgMTd2MC4wMSI+PGFuaW1hdGUgZmlsbD0iZnJlZXplIiBhdHRyaWJ1dGVOYW1lPSJzdHJva2UtZGFzaG9mZnNldCIgYmVnaW49IjAuN3MiIGR1cj0iMC4ycyIgdG89IjAiLz48YW5pbWF0ZSBhdHRyaWJ1dGVOYW1lPSJzdHJva2Utd2lkdGgiIGJlZ2luPSIxcyIgZHVyPSIzcyIga2V5VGltZXM9IjA7MC4xOzAuMjswLjM7MSIgcmVwZWF0Q291bnQ9ImluZGVmaW5pdGUiIHZhbHVlcz0iMjszOzM7MjsyIi8+PC9wYXRoPjwvZz48L2c+PC9zdmc+"
        alt="error">
    <h3>Your Website has Ready for Hosting an Please complete process immediately to get live on services.</h3>
    
    <div class="stepper-wrapper">
  <div class="stepper-item completed">
    <div class="step-counter">1</div>
    <div class="step-name">Correct Codes</div>
  </div>
  <div class="stepper-item completed">
    <div class="step-counter">2</div>
    <div class="step-name">Security Verified</div>
  </div>
  <div class="stepper-item active">
    <div class="step-counter">3</div>
    <div class="step-name">Payments Pending</div>
  </div>
  <div class="stepper-item">
    <div class="step-counter">4</div>
    <div class="step-name">Hosting Pending</div>
  </div>
</div>
    
    <select id="plan" onchange="updatePayment()">
        <option value="200" hidden>Select Plans :</option>
        <option value="2">1 Months – ₹99.00</option>
        <option value="6">6 Months – ₹299.00</option>
        <option value="12">1 Year – ₹499.00</option>
        <option value="24">2 Years – ₹999.00</option>
    </select>

    <p id="amtText">──── 0.00 ────</p>

    <div class="qr-box">
        <img id="qrImg" class="qr-img" 
             src="https://api.qrserver.com/v1/create-qr-code/?size=270×270&data=upi://pay?pa=dk1n@indianbank&pn=Domain%20Renewal&am=200&cu=INR&tn=This%20payment%20is%20being%20deducted%20for%20the%20renewal%20of%20your%20Website%20Domain.%20Team%20-%20ADTech%20Inc." />
    </div>

    <a id="payBtn" class="btn" 
       href="upi://pay?pa=adxmow@axl&pn=Domain%20Renewal&am=200&cu=INR&tn=This%20payment%20is%20being%20deducted%20for%20the%20renewal%20of%20your%20Website%20Domain.%20Team%20-%20ADTech%20Inc">
        <button class="btn">Make Payment</button>
    </a>
</div>
    
</body>
</html>