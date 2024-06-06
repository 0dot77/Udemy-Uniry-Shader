Shader "Holistic/AllProps"
{
    Properties
    {
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        struct Input
        {
            float2 uv_MainTex;
        };
        void surf (Input IN, inout SurfaceOutput o)
        {
            
        }
        ENDCG
    }
    FallBack "Diffuse"
}
