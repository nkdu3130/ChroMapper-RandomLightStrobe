using UnityEngine;

namespace RandomLightStrobe
{
    [Plugin("Random Light Strobe")]
    public sealed class Plugin
    {
        [Init]
        private void Init() => Debug.Log("[Random Light Strobe] Plugin chargé.");
        [Exit]
        private void Exit() => Debug.Log("[Random Light Strobe] Plugin déchargé.");
    }
}