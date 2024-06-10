Shader "Holistic/PropChallenge2"
{
    Properties
    {
        _myTex ("Example Texture", 2D) = "white" {}
    
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        sampler2D _myTex;

        struct Input
        {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo.rb = tex2D(_myTex, IN.uv_MainTex).rb;
            o.Albedo.g = 1;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
