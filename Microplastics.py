import streamlit as st
import time
import random

# --- PAGE CONFIGURATION ---
st.set_page_config(
    page_title="Microplastic Hunter",
    page_icon="🌊",
    layout="centered"
)

# --- CUSTOM STYLES (Colors for Kids) ---
st.markdown("""
    <style>
    .stButton>button { 
        background-color: #0288D1; 
        color: white; 
        border-radius: 12px; 
        font-weight: bold;
    }
    .big-text { font-size: 18px !important; }
    .highlight { color: #D84315; font-weight: bold; }
    </style>
    """, unsafe_allow_html=True)

# --- HEADER ---
st.title("🌊 The Ocean Rescue Mission")
st.write("Based on science by *Wang et al. (2023)*")
st.markdown("---")

# --- TABS ---
tab1, tab2, tab3 = st.tabs(["👾 The Villain", "🛡️ The Hero", "🎮 Game"])

# --- TAB 1: THE PROBLEM ---
with tab1:
    st.header("The Tiny Monsters: Microplastics")
    
    st.image("https://images.unsplash.com/photo-1621451537084-482c73073a0f?auto=format&fit=crop&w=600&q=80", caption="Plastic floating in water taken from unspalsh.com")
    
    st.write("""
    ### Did you know?
    When plastic bottles break down, they turn into tiny pieces called **Microplastics**.
    
    👀 **They are invisible!** smaller than a grain of sand.
    🥤 **They are everywhere!** In the ocean, in rivers, and even in tea bags!
    🐟 **Fish eat them** by mistake, and that makes them sick.
    """)
    
    st.warning("We need to catch them! But how? Filters made of plastic create MORE waste! 😱")

# --- TAB 2: THE SOLUTION ---
with tab2:
    st.header("The Hero: Super Sawdust! 🪵")
    
    st.image("https://images.unsplash.com/photo-1589939705384-5185137a7f0f?auto=format&fit=crop&w=600&q=80", caption="Wood Sawdust taken from unspalsh.com")
    
    st.markdown("""
    Scientists found a way to use **WOOD SAWDUST** to clean water!
    
    ### How does it work? 🧪
    1. **Take Sawdust:** Like the dust from a pencil sharpener.
    2. **Add Plant Juice (Tannic Acid):** This is found in grapes and tea. 🍇
    3. **Mix it up:** The plant juice acts like **GLUE**.
    
    ✨ **THE MAGIC:** The mixture acts like **sticky velcro**. It grabs the microplastics and holds them tight, but lets the clean water flow through!
    """)
    
    st.info("✅ It is cheap.\n✅ It is natural.\n✅ It protects our organs!")

# --- TAB 3: THE GAME ---
with tab3:
    st.header("🎮 Mission: Clean the Water")
    
    st.write("Oh no! This cup of water is full of microplastics. Use the **BioCap Sawdust** to clean it!")
    
    # User Inputs
    col1, col2 = st.columns(2)
    with col1:
        pollution_level = st.slider("How dirty is the water? (Particles)", 100, 1000, 500)
    with col2:
        sawdust_amount = st.select_slider("How much Sawdust filter?", options=["None", "A Little", "A Lot", "SUPER FILTER"])
    
    # Filter Logic
    efficiency = 0
    if sawdust_amount == "None": efficiency = 0
    elif sawdust_amount == "A Little": efficiency = 0.30
    elif sawdust_amount == "A Lot": efficiency = 0.70
    elif sawdust_amount == "SUPER FILTER": efficiency = 0.99
    
    # Button to Run Simulation
    if st.button("🚿 START FILTERING"):
        
        # 1. Show Pollution
        st.write("🌊 Water entering filter...")
        my_bar = st.progress(0)
        
        for percent_complete in range(100):
            time.sleep(0.02)
            my_bar.progress(percent_complete + 1)
        
        # 2. Calculate Results
        removed = int(pollution_level * efficiency)
        remaining = pollution_level - removed
        
        # 3. Show Results
        st.markdown("---")
        c1, c2 = st.columns(2)
        
        with c1:
            st.metric(label="Plastics Caught 🗑️", value=removed)
        with c2:
            st.metric(label="Plastics Remaining 👾", value=remaining, delta=f"-{removed} removed")
            
        # 4. Final Message
        if remaining < 10:
            st.balloons()
            st.success("🎉 AMAZING! The water is super clean! The fish are happy! 🐟💙")
        elif remaining < 200:
            st.warning("⚠️ Not bad, but some plastics escaped. Try adding more sawdust!")
        else:
            st.error("🚨 FAIL! The water is still dirty. Use the SUPER FILTER next time!")
