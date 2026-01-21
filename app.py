import streamlit as st
import time

# --- CONFIGURACIÓN DE LA PÁGINA ---
st.set_page_config(
    page_title="Biochar Adventure",
    page_icon="🌱",
    layout="centered"
)

# --- ESTILOS PERSONALIZADOS ---
st.markdown("""
    <style>
    .big-font { font-size:20px !important; }
    .stButton>button { background-color: #FF7043; color: white; border-radius: 10px; width: 100%; }
    </style>
    """, unsafe_allow_html=True)

# --- TÍTULO ---
st.title("🌱 The Magic of Biochar")
st.write("Welcome, explorer! Let's save the planet! 🌍")

# --- PESTAÑAS ---
tab1, tab2, tab3 = st.tabs(["📖 Story", "⚗️ The Lab", "❓ Quiz"])

# --- PESTAÑA 1: HISTORIA ---
with tab1:
    st.header("What is Biochar?")
    st.image("https://upload.wikimedia.org/wikipedia/commons/thumb/e/e6/Biochar.jpg/640px-Biochar.jpg", caption="This black rock is magic!")
    
    st.info("""
    **1. NATURE'S LEFTOVERS** 🍂  
    We take old wood 🪵, corn stalks 🌽, and even poop 💩!

    **2. THE OVEN** 🔥  
    We cook it with **NO AIR**. If we use air, it turns to ash. Without air, it becomes **BIOCHAR**.

    **3. SUPERPOWER** 🦸  
    It acts like a sponge 🧽 in the soil, holds water, and stops bad gas (CO2) from warming the Earth.
    """)

# --- PESTAÑA 2: LABORATORIO ---
with tab2:
    st.header("🧑‍🔬 Biochar Maker 3000")
    
    col1, col2 = st.columns(2)
    
    with col1:
        biomass = st.number_input("How much waste? (kg)", min_value=0.0, step=1.0)
    
    with col2:
        material = st.selectbox("Material Type", ["🪵 Wood Chips", "🌽 Corn Stalks", "💩 Manure", "🌿 Garden Waste"])
    
    if st.button("🔥 COOK IT! 🔥"):
        if biomass > 0:
            with st.spinner('Cooking... 🔥'):
                time.sleep(1) # Efecto de espera
                
            # Cálculos
            rate = 0.30
            if "Corn" in material: rate = 0.25
            if "Manure" in material: rate = 0.20
            
            yield_val = biomass * rate
            co2 = yield_val * 3.0
            
            st.success(f"✨ AMAZING WORK! ✨")
            st.metric(label="Biochar Created", value=f"{yield_val:.1f} kg")
            st.metric(label="CO2 Saved", value=f"{co2:.1f} kg", delta="Great Job!")
            st.balloons()
        else:
            st.warning("Please enter a number greater than 0! 🔢")

# --- PESTAÑA 3: QUIZ ---
with tab3:
    st.header("🧠 Test your Brain")
    
    q1 = st.radio("1. What does Biochar act like in the soil?", ["A rock 🪨", "A sponge 🧽", "A piece of plastic 🥤"])
    
    q2 = st.radio("2. Does making Biochar need air?", ["Yes, lots of air! 💨", "No, zero air! 🚫"])
    
    if st.button("Check Answers"):
        score = 0
        if "sponge" in q1: score += 1
        if "zero air" in q2: score += 1
        
        if score == 2:
            st.success("🌟 2/2 CORRECT! You are a Biochar Master!")
            st.snow()
        elif score == 1:
            st.warning("👍 1/2 Correct. Keep trying!")
        else:
            st.error("🙃 0/2. Read the Story tab again!")
